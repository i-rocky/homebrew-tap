#!/usr/bin/env bash
set -euo pipefail

REPO="i-rocky/dockerx"
API_URL="https://api.github.com/repos/${REPO}/releases/latest"

tmp_json="$(mktemp)"
status_code="$(curl -sS -o "${tmp_json}" -w "%{http_code}" "${API_URL}")"
if [[ "${status_code}" == "404" ]]; then
  echo "No release found for ${REPO}; skipping."
  rm -f "${tmp_json}"
  exit 0
fi
if [[ "${status_code}" != "200" ]]; then
  echo "GitHub API error (${status_code}) while reading ${API_URL}" >&2
  cat "${tmp_json}" >&2
  rm -f "${tmp_json}"
  exit 1
fi

release_json="$(cat "${tmp_json}")"
rm -f "${tmp_json}"
tag="$(echo "${release_json}" | jq -r '.tag_name // empty')"

if [[ -z "${tag}" ]]; then
  echo "No release tag found for ${REPO}; skipping."
  exit 0
fi

version="${tag#v}"
base_url="https://github.com/${REPO}/releases/download/${tag}"
sums_url="${base_url}/SHA256SUMS.txt"
sums="$(curl -fsSL "${sums_url}")"

sha_for() {
  local name="$1"
  local sha
  sha="$(echo "${sums}" | awk -v n="${name}" '$2 ~ ("(^|/|\\./)" n "$") {print $1; exit}')"
  if [[ -z "${sha}" ]]; then
    echo "Missing sha for ${name}" >&2
    exit 1
  fi
  echo "${sha}"
}

darwin_amd64_name="dockerx-darwin-x86_64-${tag}.tar.gz"
darwin_arm64_name="dockerx-darwin-aarch64-${tag}.tar.gz"
linux_amd64_name="dockerx-linux-x86_64-${tag}.tar.gz"
linux_arm64_name="dockerx-linux-aarch64-${tag}.tar.gz"

darwin_amd64_sha="$(sha_for "${darwin_amd64_name}")"
darwin_arm64_sha="$(sha_for "${darwin_arm64_name}")"
linux_amd64_sha="$(sha_for "${linux_amd64_name}")"
linux_arm64_sha="$(sha_for "${linux_arm64_name}")"

mkdir -p Formula
cat > Formula/dockerx.rb <<EOF
class Dockerx < Formula
  desc "Hardened Docker dev environment launcher"
  homepage "https://github.com/${REPO}"
  version "${version}"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "${base_url}/${darwin_arm64_name}"
      sha256 "${darwin_arm64_sha}"
    else
      url "${base_url}/${darwin_amd64_name}"
      sha256 "${darwin_amd64_sha}"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "${base_url}/${linux_arm64_name}"
      sha256 "${linux_arm64_sha}"
    else
      url "${base_url}/${linux_amd64_name}"
      sha256 "${linux_amd64_sha}"
    end
  end

  def install
    bin.install "dockerx"
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/dockerx --version")
  end
end
EOF

echo "Updated Formula/dockerx.rb to ${version}"

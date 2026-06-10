class Caffeinate < Formula
  desc "Cross-platform caffeinate command for Linux and Windows"
  homepage "https://github.com/i-rocky/caffeinate"
  version "0.1.1"
  license "MIT"

  # macOS ships caffeinate natively; this formula is Linux-only on purpose.
  depends_on :linux

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/i-rocky/caffeinate/releases/download/v0.1.1/caffeinate-linux-aarch64-v0.1.1.tar.gz"
      sha256 "38a418a640341877c2e34f296c060d8aac3f072316e05c38e116266e277ae478"
    else
      url "https://github.com/i-rocky/caffeinate/releases/download/v0.1.1/caffeinate-linux-x86_64-v0.1.1.tar.gz"
      sha256 "1dc6fbdf9166d68f89ac5e9a4a56676c5004a3e48d095283804e3e256c430ce3"
    end
  end

  def install
    bin.install "caffeinate"
  end

  test do
    assert_predicate bin/"caffeinate", :exist?
  end
end

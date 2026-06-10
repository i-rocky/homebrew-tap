class Limitbar < Formula
  desc "Always-visible usage meter for LLM rate-limit windows"
  homepage "https://i-rocky.github.io/limitbar/"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/i-rocky/limitbar/releases/download/v0.1.0/limitbar-darwin-aarch64-v0.1.0.tar.gz"
      sha256 "8cae6343c6491c512f796699ce0bc3ec8da5c6bf9971fa4aa27d999961301bdc"
    else
      url "https://github.com/i-rocky/limitbar/releases/download/v0.1.0/limitbar-darwin-x86_64-v0.1.0.tar.gz"
      sha256 "181d3d813c6544cd0412966b5ac65b290be209f41b4b6de05d7d805ab9bb851b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/i-rocky/limitbar/releases/download/v0.1.0/limitbar-linux-aarch64-v0.1.0.tar.gz"
      sha256 "39dbd698aec975eeeca694b010ab030947e5c53c4e3615febcb3ac0f6e177b0f"
    else
      url "https://github.com/i-rocky/limitbar/releases/download/v0.1.0/limitbar-linux-x86_64-v0.1.0.tar.gz"
      sha256 "fb681688a76265213ee948575f517d1c39080c02212bc95b755bff59e447f466"
    end
  end

  def install
    bin.install "limitbar"
  end

  test do
    assert_predicate bin/"limitbar", :exist?
  end
end

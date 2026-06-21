class Pixr < Formula
  desc "Image resizing and format conversion CLI"
  homepage "https://github.com/i-rocky/pixr"
  version "1.0.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/i-rocky/pixr/releases/download/v1.0.12/pixr-darwin-aarch64-v1.0.12"
      sha256 "ff5f1047ee2a8cee55fa00ab8be8abe75a943e897584935515c3b5d58b5331ce"
    else
      url "https://github.com/i-rocky/pixr/releases/download/v1.0.12/pixr-darwin-x86_64-v1.0.12"
      sha256 "91a21fea1975c5c612c95b8d20f099b12d45a45c0886ac9d6ae858b9816405b8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/i-rocky/pixr/releases/download/v1.0.12/pixr-linux-aarch64-v1.0.12"
      sha256 "39c1763248fa44f406728135dd001b894a034157a7636f94b09dfbf16992999b"
    else
      url "https://github.com/i-rocky/pixr/releases/download/v1.0.12/pixr-linux-x86_64-v1.0.12"
      sha256 "289cdae6b9fd3b0bfaaa5e2348b84a1c00ee737e5e3d05d5906c2a98f29c8c5c"
    end
  end

  def install
    arch = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "darwin" : "linux"
    bin.install "pixr-#{os}-#{arch}-v#{version}" => "pixr"
  end

  test do
    assert_predicate bin/"pixr", :exist?
  end
end

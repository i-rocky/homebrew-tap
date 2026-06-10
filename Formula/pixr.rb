class Pixr < Formula
  desc "Image resizing and format conversion CLI"
  homepage "https://github.com/i-rocky/pixr"
  version "1.0.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/i-rocky/pixr/releases/download/v1.0.11/pixr-darwin-aarch64-v1.0.11"
      sha256 "739f0dbe05001dd4923ae71b652c459c40ebef8b0a6d5f08e235d7ee8c94584a"
    else
      url "https://github.com/i-rocky/pixr/releases/download/v1.0.11/pixr-darwin-x86_64-v1.0.11"
      sha256 "8fe223fa41985acdebdc844ecdb70b355b52698be0ea892c726cfd0fb0bbbbd6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/i-rocky/pixr/releases/download/v1.0.11/pixr-linux-aarch64-v1.0.11"
      sha256 "7ade53fa41bb41d06ad75a0ef76156730c57a4defaced4db23bc3dd0c5594b4c"
    else
      url "https://github.com/i-rocky/pixr/releases/download/v1.0.11/pixr-linux-x86_64-v1.0.11"
      sha256 "0f3f000b1ca26f9d2d285199af53bd5d98c0b450872094bd1985215af317ef5e"
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

class Pixr < Formula
  desc "Image resizing and format conversion CLI"
  homepage "https://github.com/i-rocky/pixr"
  version "1.0.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/i-rocky/pixr/releases/download/v1.0.10/pixr-darwin-aarch64-v1.0.10"
      sha256 "6ab9c94fad28f3c927981fd5e5826843e71a29d70bdf9ed3db64e7f33d76d0e1"
    else
      url "https://github.com/i-rocky/pixr/releases/download/v1.0.10/pixr-darwin-x86_64-v1.0.10"
      sha256 "f03b17683caeb70b650c2efc2639bdccfa4b26e11073185d19d4dc7d620c35e6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/i-rocky/pixr/releases/download/v1.0.10/pixr-linux-aarch64-v1.0.10"
      sha256 "732f03073bd7e7f561c0cd36bdf68e11ec6a515ced448dc04ae58ed26b060a98"
    else
      url "https://github.com/i-rocky/pixr/releases/download/v1.0.10/pixr-linux-x86_64-v1.0.10"
      sha256 "480aad6d3ab2abf4e23112d3ceff4b5923e5dd07dbfcf11ae912d65c909f084e"
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

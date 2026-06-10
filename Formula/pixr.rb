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
      sha256 "601aadd393ebaaa38be1c36efd40588f27d9e8b49b655ed81b9575b6ae950210"
    else
      url "https://github.com/i-rocky/pixr/releases/download/v1.0.10/pixr-linux-x86_64-v1.0.10"
      sha256 "c06d49d4c9472af9ebabcb7d8a1206acc2fb5ffd665e19411de582ee07f1b4a0"
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

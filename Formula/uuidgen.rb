class Uuidgen < Formula
  desc "uuidgen-compatible UUID generator (v1/v3/v4/v5)"
  homepage "https://github.com/i-rocky/uuid"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/i-rocky/uuid/releases/download/v0.1.0/uuid-darwin-aarch64-v0.1.0.tar.gz"
      sha256 "d5765355891a9890986bb7312f87423bbff0d8f66dc0c1fcd47ea07709df71f8"
    else
      url "https://github.com/i-rocky/uuid/releases/download/v0.1.0/uuid-darwin-x86_64-v0.1.0.tar.gz"
      sha256 "e23925573f9e609b16bff61469a1e65ea39842b3d3dc43b63fc778b0d272c54d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/i-rocky/uuid/releases/download/v0.1.0/uuid-linux-aarch64-v0.1.0.tar.gz"
      sha256 "9483cfaa80fc0fa086ffa0e7908485674e77167157b24d77a04400aa63daa9ae"
    else
      url "https://github.com/i-rocky/uuid/releases/download/v0.1.0/uuid-linux-x86_64-v0.1.0.tar.gz"
      sha256 "48f25343e588dbbd329af011cd57e4f8a1f527c867819d5fd05093c9b646b8c3"
    end
  end

  def install
    bin.install "uuidgen"
  end

  test do
    assert_match(/\A[0-9a-fA-F-]{36}\s*\z/, shell_output("#{bin}/uuidgen"))
  end
end

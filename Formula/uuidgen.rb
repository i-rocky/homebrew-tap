class Uuidgen < Formula
  desc "uuidgen-compatible UUID generator (v1/v3/v4/v5)"
  homepage "https://github.com/i-rocky/uuid"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/i-rocky/uuid/releases/download/v0.1.0/uuid-darwin-aarch64-v0.1.0.tar.gz"
      sha256 "a7d3a8f96630e6cb9a3652b66577d3d15b43dbe1add75213018469f0e08c128d"
    else
      url "https://github.com/i-rocky/uuid/releases/download/v0.1.0/uuid-darwin-x86_64-v0.1.0.tar.gz"
      sha256 "8c14383347532f0da5dc9dab229f2361ff8f258b34d4b9af82ec844b340c14c1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/i-rocky/uuid/releases/download/v0.1.0/uuid-linux-aarch64-v0.1.0.tar.gz"
      sha256 "2814e249eaa01290e9d41fd74baa707780962b072d1529a81ccaa3005f72f741"
    else
      url "https://github.com/i-rocky/uuid/releases/download/v0.1.0/uuid-linux-x86_64-v0.1.0.tar.gz"
      sha256 "55eb2d6839f783ae202eab0b17d9eb3a394ea992fcb19ee346c89b1df1495a98"
    end
  end

  def install
    bin.install "uuidgen"
  end

  test do
    assert_match(/\A[0-9a-fA-F-]{36}\s*\z/, shell_output("#{bin}/uuidgen"))
  end
end

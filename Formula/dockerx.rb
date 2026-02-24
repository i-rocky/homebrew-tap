class Dockerx < Formula
  desc "Hardened Docker dev environment launcher"
  homepage "https://github.com/i-rocky/dockerx"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/i-rocky/dockerx/releases/download/v0.1.2/dockerx-darwin-aarch64-v0.1.2.tar.gz"
      sha256 "8593e5374d1ea5c36cd639744d93153b648c74ec7a6811cdff3940d70736e3b9"
    else
      url "https://github.com/i-rocky/dockerx/releases/download/v0.1.2/dockerx-darwin-x86_64-v0.1.2.tar.gz"
      sha256 "e407f1b7417140b0cc4344356fb9a9c8c4d608393d2d98ecafc9b89a5872ca3b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/i-rocky/dockerx/releases/download/v0.1.2/dockerx-linux-aarch64-v0.1.2.tar.gz"
      sha256 "bb3c9dade22178d0d52a2e55b3344fd3415349f4e492417c97c11306a50ac048"
    else
      url "https://github.com/i-rocky/dockerx/releases/download/v0.1.2/dockerx-linux-x86_64-v0.1.2.tar.gz"
      sha256 "56e1a72bce831aa142cb30607cd3881c4612fcdde0cc7f9b5255ea4a8e90c051"
    end
  end

  def install
    bin.install "dockerx"
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/dockerx --version")
  end
end

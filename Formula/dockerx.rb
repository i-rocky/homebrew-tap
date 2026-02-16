class Dockerx < Formula
  desc "Hardened Docker dev environment launcher"
  homepage "https://github.com/i-rocky/dockerx"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/i-rocky/dockerx/releases/download/v0.1.0/dockerx-darwin-aarch64-v0.1.0.tar.gz"
      sha256 "201e93928912b2c40ae3d8ebc6ae8d33cbba1b2cbcd90dab1391813abe96e436"
    else
      url "https://github.com/i-rocky/dockerx/releases/download/v0.1.0/dockerx-darwin-x86_64-v0.1.0.tar.gz"
      sha256 "8a625170a81cfe192bd01e5407bece4803579a1b1047fc8a1333673e0e214bb2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/i-rocky/dockerx/releases/download/v0.1.0/dockerx-linux-aarch64-v0.1.0.tar.gz"
      sha256 "045bd099a2d83f958c7086d73cb97ac6505ca65e858851fce15755b45af31c6c"
    else
      url "https://github.com/i-rocky/dockerx/releases/download/v0.1.0/dockerx-linux-x86_64-v0.1.0.tar.gz"
      sha256 "017005d67d1b9ed422a6cdee83348af876a28922d2f23cc151d4ecba9db8448b"
    end
  end

  def install
    bin.install "dockerx"
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/dockerx --version")
  end
end

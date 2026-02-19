class Dockerx < Formula
  desc "Hardened Docker dev environment launcher"
  homepage "https://github.com/i-rocky/dockerx"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/i-rocky/dockerx/releases/download/v0.1.1/dockerx-darwin-aarch64-v0.1.1.tar.gz"
      sha256 "55c7db297af13125a04e62ba66520231a6b9dce4d690c3fda411e672c598eca4"
    else
      url "https://github.com/i-rocky/dockerx/releases/download/v0.1.1/dockerx-darwin-x86_64-v0.1.1.tar.gz"
      sha256 "96953b6fb5ca6519da55dbe66192e489693fbb6b0355879de40c547aab8fc989"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/i-rocky/dockerx/releases/download/v0.1.1/dockerx-linux-aarch64-v0.1.1.tar.gz"
      sha256 "36a01e2e600ca933d5975468f3e11a945c5518880ab46aab94bbc8531a878174"
    else
      url "https://github.com/i-rocky/dockerx/releases/download/v0.1.1/dockerx-linux-x86_64-v0.1.1.tar.gz"
      sha256 "2db5c9872e5bb1a40b617f7de674207c6c8b91228c939ea99371e0b7e169740b"
    end
  end

  def install
    bin.install "dockerx"
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/dockerx --version")
  end
end

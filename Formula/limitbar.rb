class Limitbar < Formula
  desc "Always-visible usage meter for LLM rate-limit windows"
  homepage "https://i-rocky.github.io/limitbar/"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/i-rocky/limitbar/releases/download/v0.2.0/limitbar-darwin-aarch64-v0.2.0.tar.gz"
      sha256 "9f3d2b5cb9dd7e2c7232e30ac3851d469166d12b34dd0c66ce1d8a26c7fdfdbb"
    else
      url "https://github.com/i-rocky/limitbar/releases/download/v0.2.0/limitbar-darwin-x86_64-v0.2.0.tar.gz"
      sha256 "9d20b82f34962596ddf36121420c844bf9a9b5d88cf61ac41b3235f2f6b6ca95"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/i-rocky/limitbar/releases/download/v0.2.0/limitbar-linux-aarch64-v0.2.0.tar.gz"
      sha256 "f6bbb5affa506858e6a99a37d96bc5b287a4634cc29f2f3158f29be9e20799fb"
    else
      url "https://github.com/i-rocky/limitbar/releases/download/v0.2.0/limitbar-linux-x86_64-v0.2.0.tar.gz"
      sha256 "a34e3c2f52482a7c00adafdc290042208ffbac763551377e8e1e6d7de3f74115"
    end
  end

  def install
    bin.install "limitbar"
  end

  test do
    assert_predicate bin/"limitbar", :exist?
  end
end

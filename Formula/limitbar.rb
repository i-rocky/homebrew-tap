class Limitbar < Formula
  desc "Always-visible usage meter for LLM rate-limit windows"
  homepage "https://i-rocky.github.io/limitbar/"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/i-rocky/limitbar/releases/download/v0.1.0/limitbar-darwin-aarch64-v0.1.0.tar.gz"
      sha256 "43e78cd61cd6ab357c1180fd54213ded72b380c88123030530ca65c11d734d10"
    else
      url "https://github.com/i-rocky/limitbar/releases/download/v0.1.0/limitbar-darwin-x86_64-v0.1.0.tar.gz"
      sha256 "d586ad8216affba41a0a7b66d9b7cf59b158e6fba98ec3d0c6d8c4e06d40000d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/i-rocky/limitbar/releases/download/v0.1.0/limitbar-linux-aarch64-v0.1.0.tar.gz"
      sha256 "19d5aceb822cfa10d086afadc3800003ac82de1213dc6e4563ca2a44d621242f"
    else
      url "https://github.com/i-rocky/limitbar/releases/download/v0.1.0/limitbar-linux-x86_64-v0.1.0.tar.gz"
      sha256 "6d24d4888a210e73d2015b0787e8f97f6d1e75d0f33dd79d38d756831816b834"
    end
  end

  def install
    bin.install "limitbar"
  end

  test do
    assert_predicate bin/"limitbar", :exist?
  end
end

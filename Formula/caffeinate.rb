class Caffeinate < Formula
  desc "Cross-platform caffeinate command for Linux and Windows"
  homepage "https://github.com/i-rocky/caffeinate"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/i-rocky/caffeinate/releases/download/v0.1.1/caffeinate-darwin-aarch64-v0.1.1.tar.gz"
      sha256 "f956ac8ed551d149cbca2684e39bc442c9e2cacc320fd3823a6cb91a4645fb09"
    else
      url "https://github.com/i-rocky/caffeinate/releases/download/v0.1.1/caffeinate-darwin-x86_64-v0.1.1.tar.gz"
      sha256 "d25b4df6dd45b837d8d044d20879b20928f206d047a7caf5ee7b7a50cb1898ba"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/i-rocky/caffeinate/releases/download/v0.1.1/caffeinate-linux-aarch64-v0.1.1.tar.gz"
      sha256 "4bb6416ac7c13db05bed82ae91696eded04b774a0a05592207816f3a7d4237c0"
    else
      url "https://github.com/i-rocky/caffeinate/releases/download/v0.1.1/caffeinate-linux-x86_64-v0.1.1.tar.gz"
      sha256 "e43a0e9b7df447053ad5cb0ba750c4f7e907a936fc8fe6c672eec27153ec72be"
    end
  end

  def install
    bin.install "caffeinate"
  end

  test do
    assert_predicate bin/"caffeinate", :exist?
  end
end

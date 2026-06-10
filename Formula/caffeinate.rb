class Caffeinate < Formula
  desc "Cross-platform caffeinate command for Linux and Windows"
  homepage "https://github.com/i-rocky/caffeinate"
  version "0.1.1"
  license "MIT"

  # macOS ships caffeinate natively; this formula is Linux-only on purpose.
  depends_on :linux

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

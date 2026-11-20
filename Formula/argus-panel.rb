class ArgusPanel < Formula
  desc "Terminal panel for running many coding-agent sessions side by side on tmux"
  homepage "https://github.com/Marcone-Santos1/argus"
  version "0.2.0"
  license "MIT"

  depends_on "tmux"

  conflicts_with "argus", because: "both install an `argus` binary"

  on_macos do
    on_arm do
      url "https://github.com/Marcone-Santos1/argus/releases/download/v0.2.0/argus_0.2.0_darwin_arm64.tar.gz"
      sha256 "b74039c7352e0983479a28a737c18ae9097f303f60e918de8462322971de19f9"
    end
    on_intel do
      url "https://github.com/Marcone-Santos1/argus/releases/download/v0.2.0/argus_0.2.0_darwin_amd64.tar.gz"
      sha256 "545c85f904a98b8948a8f60bd40101c00a8cd76be56cf3f2a0160dcf44515a31"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Marcone-Santos1/argus/releases/download/v0.2.0/argus_0.2.0_linux_arm64.tar.gz"
      sha256 "8974e498132d2b62acbe91508e6bf58c6dc6bdfcc46cee9a3da5191234fa2a65"
    end
    on_intel do
      url "https://github.com/Marcone-Santos1/argus/releases/download/v0.2.0/argus_0.2.0_linux_amd64.tar.gz"
      sha256 "da461b27120292b3b226073b3fa91a6fd62824a6233ae13053209b6db752bc73"
    end
  end

  def install
    bin.install "argus"
  end

  def caveats
    <<~TEXT
      Run once to add the status hooks and the tmux config:
        argus install
      Then open the panel with:
        argus
    TEXT
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/argus version")
  end
end

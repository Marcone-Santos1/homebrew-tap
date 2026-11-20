class ArgusPanel < Formula
  desc "Terminal panel for running many coding-agent sessions side by side on tmux"
  homepage "https://github.com/Marcone-Santos1/argus"
  version "0.1.1"
  license "MIT"

  depends_on "tmux"

  conflicts_with "argus", because: "both install an `argus` binary"

  on_macos do
    on_arm do
      url "https://github.com/Marcone-Santos1/argus/releases/download/v0.1.1/argus_0.1.1_darwin_arm64.tar.gz"
      sha256 "fd443778f305484dbc79c6a39eb3c743a2a227e6a29fec8ceceae8ad693e3538"
    end
    on_intel do
      url "https://github.com/Marcone-Santos1/argus/releases/download/v0.1.1/argus_0.1.1_darwin_amd64.tar.gz"
      sha256 "ebac99187fadf0181d65e463f2ea14f14bc30948a0fbe6675e9cfc3e65fae263"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Marcone-Santos1/argus/releases/download/v0.1.1/argus_0.1.1_linux_arm64.tar.gz"
      sha256 "ae7170f42ee21b71f8016e94b9c8fce6d669cff8ce7662d3e9d6e08854d092b6"
    end
    on_intel do
      url "https://github.com/Marcone-Santos1/argus/releases/download/v0.1.1/argus_0.1.1_linux_amd64.tar.gz"
      sha256 "a4d7649ddc19b11f437b87a8e708300aa4c1c132f2bd590e5d35c2a6d7fcf562"
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

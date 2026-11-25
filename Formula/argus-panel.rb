class ArgusPanel < Formula
  desc "Terminal panel for running many coding-agent sessions side by side on tmux"
  homepage "https://github.com/Marcone-Santos1/argus"
  version "0.3.0"
  license "MIT"

  depends_on "tmux"

  conflicts_with "argus", because: "both install an `argus` binary"

  on_macos do
    on_arm do
      url "https://github.com/Marcone-Santos1/argus/releases/download/v0.3.0/argus_0.3.0_darwin_arm64.tar.gz"
      sha256 "ab3989cf5e69cdb6688a76c807378078d9f3336889d938295adf0181c310fb54"
    end
    on_intel do
      url "https://github.com/Marcone-Santos1/argus/releases/download/v0.3.0/argus_0.3.0_darwin_amd64.tar.gz"
      sha256 "cf0c3d860dd62c10ab7402e997648f997c062fa54b3b8cd2ecfeca09ea4c8aba"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Marcone-Santos1/argus/releases/download/v0.3.0/argus_0.3.0_linux_arm64.tar.gz"
      sha256 "1afb4c077554aae259693ba7b46320c033ccb1ce982c170ad6c6a980567d2d18"
    end
    on_intel do
      url "https://github.com/Marcone-Santos1/argus/releases/download/v0.3.0/argus_0.3.0_linux_amd64.tar.gz"
      sha256 "6ed7a50e2de2b2b011bc61b32ad15362d956b7e696b9b8612701d85cb2238d82"
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

class ArgusPanel < Formula
  desc "Terminal panel for running many coding-agent sessions side by side on tmux"
  homepage "https://github.com/Marcone-Santos1/argus"
  version "0.1.0"
  license "MIT"

  depends_on "tmux"

  conflicts_with "argus", because: "both install an `argus` binary"

  on_macos do
    on_arm do
      url "https://github.com/Marcone-Santos1/argus/releases/download/v0.1.0/argus_0.1.0_darwin_arm64.tar.gz"
      sha256 "5976020e24d6f00bc3047f002a04e04cbd58f2a3197fe580318868c720399589"
    end
    on_intel do
      url "https://github.com/Marcone-Santos1/argus/releases/download/v0.1.0/argus_0.1.0_darwin_amd64.tar.gz"
      sha256 "19eccb6eba8674d1c5257868fc2182bb1cfae9f7dcf97984a4bf5241abd53b9b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Marcone-Santos1/argus/releases/download/v0.1.0/argus_0.1.0_linux_arm64.tar.gz"
      sha256 "503397b944e33c37090ebfaffacddafd1c7930be4b6a9c146e7061b618b3abd2"
    end
    on_intel do
      url "https://github.com/Marcone-Santos1/argus/releases/download/v0.1.0/argus_0.1.0_linux_amd64.tar.gz"
      sha256 "2d86d223518863784edb2ac6a054ee1b08e398aeafe5ca109ba0ce5737e97858"
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

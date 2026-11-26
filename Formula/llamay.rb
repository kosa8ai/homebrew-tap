class Llamay < Formula
  desc "Local inference server with Ollama-, OpenAI- and Anthropic-compatible APIs"
  homepage "https://llamay.com"
  version "0.4.21"
  license :cannot_represent

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      # The Metal build, as install.sh picks on Apple Silicon.
      url "https://github.com/AzmxAI/llamay-releases/releases/download/v#{version}/llamay_#{version}_darwin_arm64_metal.tar.gz"
      sha256 "72ec8a6911afc55ee1d99b4f2457cb0f5ebf4efc8b7ffa9aab6b2acab43aa0de"
    end
    on_intel do
      url "https://github.com/AzmxAI/llamay-releases/releases/download/v#{version}/llamay_#{version}_darwin_amd64.tar.gz"
      sha256 "94d5dbc6b3548c8d25839dae40f213921f501054ca2ff35a4f166c75905abad0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AzmxAI/llamay-releases/releases/download/v#{version}/llamay_#{version}_linux_arm64.tar.gz"
      sha256 "85f7f5cc20d36cce96515a0c80902622a789011613493ccfb5a398c9d918dc99"
    end
    on_intel do
      url "https://github.com/AzmxAI/llamay-releases/releases/download/v#{version}/llamay_#{version}_linux_amd64.tar.gz"
      sha256 "81d2dba3df3d8b964dae1c3d15d25d61ce3280d95a8bc7c3887a6dc5008b37ab"
    end
  end

  def install
    bin.install "llamay"
  end

  service do
    run [opt_bin/"llamay", "serve"]
    keep_alive true
    log_path var/"log/llamay.log"
    error_log_path var/"log/llamay.log"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/llamay version")
  end
end

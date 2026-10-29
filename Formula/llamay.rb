class Llamay < Formula
  desc "Local inference server with Ollama-, OpenAI- and Anthropic-compatible APIs"
  homepage "https://llamay.com"
  version "0.4.15"
  license :cannot_represent

  on_macos do
    on_arm do
      # The Metal build, as install.sh picks on Apple Silicon.
      url "https://github.com/AzmxAI/llamay-releases/releases/download/v#{version}/llamay_#{version}_darwin_arm64_metal.tar.gz"
      sha256 "5db673b3fdbeddecbc2355cc23e5ffb1de71078d5d88ba1714e3d320a60b982a"
    end
    on_intel do
      url "https://github.com/AzmxAI/llamay-releases/releases/download/v#{version}/llamay_#{version}_darwin_amd64.tar.gz"
      sha256 "d1a1f76b145d1a8bbc2c82911e6d0f62d748e21d65c78545574354f6b7b4d30a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AzmxAI/llamay-releases/releases/download/v#{version}/llamay_#{version}_linux_arm64.tar.gz"
      sha256 "3ab6c4babe4a37790c931d4a81561b273d364a7694fc4f810c39c9fc2d019378"
    end
    on_intel do
      url "https://github.com/AzmxAI/llamay-releases/releases/download/v#{version}/llamay_#{version}_linux_amd64.tar.gz"
      sha256 "5bbf2e3c7e1d41d49e533427db9532abaf401d7a7ff7455a2040da6b18ae0a83"
    end
  end

  livecheck do
    url "https://github.com/AzmxAI/llamay-releases"
    strategy :github_latest
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

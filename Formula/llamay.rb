class Llamay < Formula
  desc "Local inference server with Ollama-, OpenAI- and Anthropic-compatible APIs"
  homepage "https://llamay.com"
  version "0.4.20"
  license :cannot_represent

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      # The Metal build, as install.sh picks on Apple Silicon.
      url "https://github.com/AzmxAI/llamay-releases/releases/download/v#{version}/llamay_#{version}_darwin_arm64_metal.tar.gz"
      sha256 "5008aa8f0c750de898ecda1225633d1fdbf24ca234b20c875459cc4a38f14c4e"
    end
    on_intel do
      url "https://github.com/AzmxAI/llamay-releases/releases/download/v#{version}/llamay_#{version}_darwin_amd64.tar.gz"
      sha256 "3d51919cb869bb8a464f54e84df9f0e2230e72fe35df7b339bde7ca5b28a8714"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AzmxAI/llamay-releases/releases/download/v#{version}/llamay_#{version}_linux_arm64.tar.gz"
      sha256 "e97881e59d3831e70cd2442273c47b7438e61b0d6156c59657b126a94f55d009"
    end
    on_intel do
      url "https://github.com/AzmxAI/llamay-releases/releases/download/v#{version}/llamay_#{version}_linux_amd64.tar.gz"
      sha256 "9186101945956043f93ce9524ecbf9f71c45170bc785ab04e65a55fad6004ed7"
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

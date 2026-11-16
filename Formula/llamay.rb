class Llamay < Formula
  desc "Local inference server with Ollama-, OpenAI- and Anthropic-compatible APIs"
  homepage "https://llamay.com"
  version "0.4.16"
  license :cannot_represent

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      # The Metal build, as install.sh picks on Apple Silicon.
      url "https://github.com/AzmxAI/llamay-releases/releases/download/v#{version}/llamay_#{version}_darwin_arm64_metal.tar.gz"
      sha256 "888ad751767c608734f708150aae4bde137061cac9e321505cd4c30ec6a3cd1a"
    end
    on_intel do
      url "https://github.com/AzmxAI/llamay-releases/releases/download/v#{version}/llamay_#{version}_darwin_amd64.tar.gz"
      sha256 "c47ea4629d498d043593d8f068637ff2d2493dfe44511fc655a5241b415f45ec"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AzmxAI/llamay-releases/releases/download/v#{version}/llamay_#{version}_linux_arm64.tar.gz"
      sha256 "54e67bbf6709f0d2cca1ef4382e5b0a4f81bf4b0291dd9b3221d3a7147c821fc"
    end
    on_intel do
      url "https://github.com/AzmxAI/llamay-releases/releases/download/v#{version}/llamay_#{version}_linux_amd64.tar.gz"
      sha256 "c8704d7c02e344f4c698daed1e991e099283ad8c581fdaf3f49ada64d90ca80f"
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

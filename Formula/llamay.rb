class Llamay < Formula
  desc "Local inference server with Ollama-, OpenAI- and Anthropic-compatible APIs"
  homepage "https://llamay.com"
  version "0.4.18"
  license :cannot_represent

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      # The Metal build, as install.sh picks on Apple Silicon.
      url "https://github.com/AzmxAI/llamay-releases/releases/download/v#{version}/llamay_#{version}_darwin_arm64_metal.tar.gz"
      sha256 "aa20b33e452e38ba91950d7946ee6de25fec7112b3a60360a00832ca812032f2"
    end
    on_intel do
      url "https://github.com/AzmxAI/llamay-releases/releases/download/v#{version}/llamay_#{version}_darwin_amd64.tar.gz"
      sha256 "4e6a7b4e925eb76bec937b6575fc3d668fcf598e9c898a3cee5c21d72654342d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AzmxAI/llamay-releases/releases/download/v#{version}/llamay_#{version}_linux_arm64.tar.gz"
      sha256 "f584ae7068277aec9d0fc1c45938c35f47b59621c6693a9d56be191413aa746c"
    end
    on_intel do
      url "https://github.com/AzmxAI/llamay-releases/releases/download/v#{version}/llamay_#{version}_linux_amd64.tar.gz"
      sha256 "6e97acb917c4d584832dd5dd56bc246c25acd5cf6e557f9256cc21725c114df0"
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

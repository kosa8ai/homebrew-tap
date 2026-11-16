cask "llamay-app" do
  version "0.4.16"
  sha256 "7f6d09c42da05804d82d39d963f27f22d11d28fbbb39e44d10d9633c23ac9d3f"

  url "https://github.com/AzmxAI/llamay-releases/releases/download/v#{version}/llamay_#{version}_macos.dmg",
      verified: "github.com/AzmxAI/llamay-releases/"
  name "llamay"
  desc "Local model chat app and inference server"
  homepage "https://llamay.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :ventura

  app "llamay.app"

  zap trash: [
    "~/.llamay",
    "~/Library/LaunchAgents/ai.azmx.llamay.server.plist",
    "~/Library/Logs/llamay.log",
    "~/Library/Preferences/ai.azmx.llamay.plist",
  ]
end

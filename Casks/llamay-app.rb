cask "llamay-app" do
  version "0.4.21"
  sha256 "92449c526204b39749897522b42ff7708008d9202cfabfb1aa5c726bca42c749"

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

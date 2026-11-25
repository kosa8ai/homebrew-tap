cask "llamay-app" do
  version "0.4.20"
  sha256 "de9e66dd7aa3222bcad7d80b591ebae6c1410f2c1e2812e9b685f79eb94bb13e"

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

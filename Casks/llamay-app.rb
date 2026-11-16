cask "llamay-app" do
  version "0.4.19"
  sha256 "046bfd4cf1420e10370e24b217f1839a6a136bf98324c363873ac322697e94f4"

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

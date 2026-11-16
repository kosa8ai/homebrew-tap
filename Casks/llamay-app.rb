cask "llamay-app" do
  version "0.4.17"
  sha256 "404fb4b1a734a7a9ba75b4e368db0d5e9d1756647d6809ff50c34dbf52288c0f"

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

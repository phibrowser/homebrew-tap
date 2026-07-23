cask "phi" do
  version "2.3.0,703"
  sha256 "4d6f8b2d2a83ac186cad51922e68d85ff13738e4b53fc9ab39aa0dea4b83c5e2"

  url "https://ota.phibrowser.com/mac-public/releases/Phi_#{version.csv.first}_#{version.csv.second}.zip"
  name "Phi"
  name "Phi Browser"
  desc "Chromium-based web browser with a built-in AI assistant"
  homepage "https://phibrowser.com/"

  livecheck do
    url "https://ota.phibrowser.com/mac-public/appcast/v2/PhiBrowserMacUpdate.xml"
    strategy :sparkle do |item|
      "#{item.short_version},#{item.version}"
    end
  end

  auto_updates true
  depends_on arch:  :arm64,
             macos: :sonoma

  app "Phi.app"

  uninstall quit: [
    "com.phibrowser.Mac",
    "com.phibrowser.Sentinel",
  ]

  zap trash: [
    "~/Library/Application Scripts/com.phibrowser.Sentinel",
    "~/Library/Application Scripts/group.com.phibrowser.shared",
    "~/Library/Application Support/com.phibrowser.Mac",
    "~/Library/Application Support/com.phibrowser.Sentinel",
    "~/Library/Application Support/com.phibrowser.TimeMachine/com.phibrowser.Mac",
    "~/Library/Caches/com.phibrowser.Mac",
    "~/Library/Caches/com.phibrowser.Sentinel",
    "~/Library/Containers/com.phibrowser.Sentinel",
    "~/Library/Group Containers/group.com.phibrowser.shared",
    "~/Library/HTTPStorages/com.phibrowser.Mac",
    "~/Library/HTTPStorages/com.phibrowser.Mac.binarycookies",
    "~/Library/HTTPStorages/com.phibrowser.Sentinel",
    "~/Library/HTTPStorages/com.phibrowser.Sentinel.binarycookies",
    "~/Library/LaunchAgents/com.phibrowser.Sentinel.runner.plist",
    "~/Library/Logs/PhiBrowser",
    "~/Library/Logs/PhiSentinel",
    "~/Library/Preferences/com.phibrowser.Mac.plist",
    "~/Library/Preferences/com.phibrowser.Sentinel.plist",
    "~/Library/Saved Application State/com.phibrowser.Mac.savedState",
    "~/Library/WebKit/com.phibrowser.Mac",
    "~/Library/WebKit/com.phibrowser.Sentinel",
  ]
end

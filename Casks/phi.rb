cask "phi" do
  version "1.5.1,609"
  sha256 "1e98e023ff7aab074c495c2fdf75f6d121bacb304a79a32f8e0911abe4ddc316"

  url "https://ota.phibrowser.com/mac-public/releases/Phi_#{version.csv.first}_#{version.csv.second}.zip"
  name "Phi"
  name "Phi Browser"
  desc "Chromium-based web browser with a built-in AI assistant"
  homepage "https://phibrowser.com/"

  livecheck do
    url "https://ota.phibrowser.com/mac-public/appcast/PhiBrowserMacUpdate.xml"
    strategy :sparkle do |item|
      "#{item.short_version},#{item.version}"
    end
  end

  auto_updates true
  depends_on arch:  :arm64,
             macos: :sonoma

  app "Phi.app"

  zap trash: [
    "~/Library/Application Support/Phi",
    "~/Library/Caches/com.phibrowser.Mac",
    "~/Library/Caches/Phi",
    "~/Library/HTTPStorages/com.phibrowser.Mac",
    "~/Library/Preferences/com.phibrowser.Mac.plist",
    "~/Library/Saved Application State/com.phibrowser.Mac.savedState",
  ]
end

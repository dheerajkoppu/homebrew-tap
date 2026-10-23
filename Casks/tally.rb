cask "tally" do
  version "1.1.2"
  sha256 "e7c90079fdd7028f7a18fe11d1b49d1373f56a27f6b404a16f663c1f5cefbad7"

  url "https://github.com/dheerajkoppu/tally/releases/download/v#{version}/Tally.zip"
  name "Tally"
  desc "System monitor that adds every helper process to the app it works for"
  homepage "https://dheerajkoppu.github.io/tally/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sequoia

  app "Tally.app"

  uninstall launchctl: "io.github.dheerajkoppu.tally.fanhelper",
            quit:      "io.github.dheerajkoppu.tally",
            delete:    "/Library/PrivilegedHelperTools/io.github.dheerajkoppu.tally.fanhelper"

  zap trash: [
    "~/Library/Application Support/Tally",
    "~/Library/Preferences/io.github.dheerajkoppu.tally.plist",
  ]
end

cask "tally" do
  version "1.1.1"
  sha256 "8652c5f338fd32b77adbcd36f15cdda5025ea6ed7199c0d052d7d2e3e520c744"

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

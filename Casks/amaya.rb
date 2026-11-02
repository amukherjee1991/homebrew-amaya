cask "amaya" do
  version "159.0-7"
  sha256 "11988488c196a67a7fae6d13510fd27a80d73760e46a9551fbb6e1bd0fb65f16"

  url "https://github.com/amukherjee1991/amaya-browser/releases/download/v#{version}/Amaya-#{version}-arm64.dmg"
  name "Amaya"
  desc "Privacy-first web browser built on the Gecko engine"
  homepage "https://amaya.arghyam.me/"

  depends_on arch: :arm64
  depends_on :macos

  app "Amaya.app"
  binary "#{appdir}/Amaya.app/Contents/MacOS/amaya"

  zap trash: [
    "~/Library/Application Support/Amaya",
    "~/Library/Caches/Amaya",
    "~/Library/Caches/org.amaya.Browser",
    "~/Library/Preferences/org.amaya.Browser.plist",
    "~/Library/Saved Application State/org.amaya.Browser.savedState",
  ]

  caveats <<~EOS
    This is an UNSIGNED preview build (no Apple Developer ID yet): macOS
    Gatekeeper will refuse to open it until you clear the quarantine flag:

      xattr -dr com.apple.quarantine "#{appdir}/Amaya.app"

    Apple Silicon only for now; Intel and a signed, notarized build are next.
    See https://github.com/amukherjee1991/amaya-browser/blob/main/docs/PLATFORMS_PLAN.md
  EOS
end

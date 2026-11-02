cask "amaya" do
  version "159.0-8"
  sha256 "988b95dec13ca7b2418d608e9585acf95a70e38eeeebcc381eb0e91ca9e6c52d"

  url "https://github.com/amukherjee1991/amaya-browser/releases/download/v#{version}/Amaya-#{version}-arm64.dmg"
  name "Amaya"
  desc "Privacy-first web browser built on the Gecko engine"
  homepage "https://amaya.arghyam.me/"

  depends_on arch: :arm64
  depends_on :macos

  app "Amaya.app"
  binary "#{appdir}/Amaya.app/Contents/MacOS/amaya"

  # Unsigned preview build (no Apple Developer ID yet): left quarantined,
  # syspolicyd repeatedly retries an online notarization check that can
  # never succeed and removes the app on quit once it gives up - a bare
  # right-click -> Open bypass isn't enough to stop that, the flag itself
  # has to go before the first launch. See docs/PLATFORMS_PLAN.md in the
  # browser repo.
  postflight do
    system_command "/usr/bin/xattr",
                    args: ["-dr", "com.apple.quarantine", "#{appdir}/Amaya.app"],
                    sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Amaya",
    "~/Library/Caches/Amaya",
    "~/Library/Caches/org.amaya.Browser",
    "~/Library/Preferences/org.amaya.Browser.plist",
    "~/Library/Saved Application State/org.amaya.Browser.savedState",
  ]

  caveats <<~EOS
    This is an UNSIGNED preview build (no Apple Developer ID yet). The
    quarantine flag is cleared automatically on install. If you instead
    downloaded the .dmg by hand (not via brew), clear it yourself before
    the first launch:

      xattr -dr com.apple.quarantine "#{appdir}/Amaya.app"

    Apple Silicon only for now; Intel and a signed, notarized build are next.
    See https://github.com/amukherjee1991/amaya-browser/blob/main/docs/PLATFORMS_PLAN.md
  EOS
end

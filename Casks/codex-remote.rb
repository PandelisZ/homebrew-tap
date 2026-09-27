cask "codex-remote" do
  version "0.1.0"
  sha256 "8767091b9138676bd60a86b5fe131dcee9e9193dac68a0530850f46d0ab33d9a"

  url "https://github.com/PandelisZ/codex-remote/releases/download/v#{version}/CodexRemote-#{version}.zip",
      verified: "github.com/PandelisZ/codex-remote/"
  name "Codex Remote"
  desc "Menu bar app that provisions cloud machines as remote Codex and Claude Code agents"
  homepage "https://codexremote.io/"

  depends_on macos: ">= :sequoia"

  app "CodexRemote.app"

  # The CLI ships inside the bundle; everything the menu bar does is scriptable through it.
  binary "#{appdir}/CodexRemote.app/Contents/MacOS/codex-remote"

  zap trash: [
    "~/.codex/codex-remote",
    "~/Library/Preferences/io.codexremote.app.plist",
  ]

  # This build is ad-hoc signed, not notarised. Gatekeeper reads that combination plus the
  # quarantine flag as "damaged and can't be opened" — a different error from "unidentified
  # developer", and one that right-click -> Open does NOT clear. Stripping the flag is the
  # only thing that makes an ad-hoc build launch.
  #
  # You are trading Gatekeeper's check for trust in this tap and in the checksum above, so
  # the caveat says so rather than quietly doing it.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/CodexRemote.app"],
                   sudo: false
  end

  caveats <<~EOS
    This build is ad-hoc signed rather than notarised, so macOS would otherwise refuse to
    open it ("CodexRemote is damaged"). The cask removes the quarantine flag on install,
    which means you are trusting this tap and the checksum rather than Apple's notary.

    Codex Remote runs in the menu bar and has no Dock icon.
  EOS
end

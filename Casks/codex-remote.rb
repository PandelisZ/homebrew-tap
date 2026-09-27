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

  caveats <<~EOS
    Codex Remote is ad-hoc signed rather than notarised, so the first launch needs
    right-click -> Open. It runs in the menu bar and has no Dock icon.
  EOS
end

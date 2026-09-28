cask "codex-remote" do
  version "0.5.2"
  sha256 "582e584cdcc116f802097c1b0e8f1e8ded17eb39ba58a854ae059c32052e0fa1"

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
    "~/.codex-remote",
    "~/Library/Preferences/io.codexremote.app.plist",
  ]


  caveats <<~EOS
    Codex Remote runs in the menu bar and has no Dock icon.
  EOS
end

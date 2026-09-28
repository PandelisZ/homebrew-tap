cask "codex-remote" do
  version "0.5.1"
  sha256 "f2b5ac7e8bc65eae74ccf50e0ad8f30dec3dcff8cdfa29258cd35d977f9eb649"

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

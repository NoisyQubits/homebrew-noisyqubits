cask "filespoke" do
  version "1.0.1"
  sha256 "7d1e345b9e36e69c242dd6cd92778101f5d07e5454b51fc8c5f6b937ea827829"

  url "https://github.com/NoisyQubits/FileSpoke/releases/download/v#{version}/FileSpoke-#{version}.zip"
  name "FileSpoke"
  desc "Local file conversion and editing from a Finder drag wheel"
  homepage "https://github.com/NoisyQubits/FileSpoke"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "FileSpoke.app"

  caveats <<~EOS
    FileSpoke runs in the menu bar. Launch it with:
      open -a FileSpoke

    Finder's Shift-drag wheel needs Accessibility permission in System Settings
    > Privacy & Security > Accessibility. The menu bar file picker works without it.

    The app is ad hoc signed and is not notarized. If macOS blocks the first
    launch, open FileSpoke.app from Finder using its Open command.
  EOS
end

cask "filespoke" do
  version "0.1.0"
  sha256 "fe44d8753e0e8c830809aeb44cac4263e69c67dd5811d321bca0fceed42dc0d3"

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

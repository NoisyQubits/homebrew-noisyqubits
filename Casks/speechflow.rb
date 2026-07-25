# Homebrew cask for SpeechFlow — on-device macOS dictation.
#
# Ships a prebuilt, self-signed .app from NoisyQubits/SpeechFlow releases (the
# app links private native libs and downloads a large model, so it's not a good
# fit for homebrew-core). To bump the version: cut a new tag on
# NoisyQubits/SpeechFlow (CI publishes the zip), then update `version` and
# `sha256` below. Get the checksum from the release notes or with:
#   shasum -a 256 SpeechFlow-X.Y.Z.zip
cask "speechflow" do
  version "0.1.0"
  sha256 "ec0631fba38fcda10078908c96d3042b740d03b61b33c05e70314b211f42c667"

  url "https://github.com/NoisyQubits/SpeechFlow/releases/download/v#{version}/SpeechFlow-#{version}.zip"
  name "SpeechFlow"
  desc "On-device dictation that types transcribed speech into any app"
  homepage "https://github.com/NoisyQubits/SpeechFlow"

  depends_on macos: :ventura
  depends_on arch: :arm64

  app "SpeechFlow.app"

  zap trash: "~/Library/Application Support/SpeechFlow"

  caveats <<~EOS
    SpeechFlow is a menu-bar app (no Dock icon). Launch it with:
      open -a SpeechFlow

    On first launch it downloads the speech model (~370 MB) once into
    ~/Library/Application Support/SpeechFlow. Everything runs offline afterwards.

    Grant these under System Settings → Privacy & Security:
      • Microphone    — to hear you
      • Accessibility — for the global hotkey and to type into other apps

    Then double-tap Right Shift to start/stop dictation.

    The app is self-signed, not notarized. If macOS blocks the first launch,
    right-click SpeechFlow.app in Applications → Open, or install without the
    quarantine flag:
      brew install --cask --no-quarantine noisyqubits/noisyqubits/speechflow
  EOS
end

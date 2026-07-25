# homebrew-noisyqubits

Homebrew tap for [NoisyQubits](https://github.com/NoisyQubits) tools.

## Usage

```sh
brew tap noisyqubits/noisyqubits
brew trust noisyqubits/noisyqubits   # required once: recent Homebrew won't load
                                     # a formula from an untrusted third-party tap
```

## Formulae

### tripletap

Three-finger-click Play/Pause for the macOS trackpad —
[source](https://github.com/NoisyQubits/TripleTap).

```sh
brew install tripletap
brew services start tripletap    # run in background, start at login
```

Add `--HEAD` to build the latest `main` instead of the tagged release.

## Casks

### speechflow

On-device macOS dictation — double-tap Right Shift, speak, and it types the
transcription into the focused app. Fully offline (sherpa-onnx + Moonshine) —
[source](https://github.com/NoisyQubits/SpeechFlow).

```sh
brew install --cask speechflow
open -a SpeechFlow
```

Apple Silicon, macOS 13+. First launch downloads the speech model (~370 MB)
once; then grant Microphone + Accessibility. The app is self-signed (not
notarized) — if macOS blocks it, right-click → Open, or add `--no-quarantine`.

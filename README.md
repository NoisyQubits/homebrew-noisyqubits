# homebrew-noisyqubits

Homebrew tap for [NoisyQubits](https://github.com/NoisyQubits) tools.

## Usage

```sh
brew tap noisyqubits/noisyqubits
brew trust noisyqubits/noisyqubits   # required once: recent Homebrew won't load
                                     # a formula from an untrusted third-party tap
```

## Formulae

### recall

History-backed predictive command suggestions for Zsh —
[source](https://github.com/NoisyQubits/recall).

```sh
brew install recall
echo 'source "$(brew --prefix recall)/libexec/recall.plugin.zsh"' >> ~/.zshrc
```

ListView is active by default. Up/Down navigates candidates and Enter executes
the selected command. Recall 0.2 uses a powder-gray selected row with
bright-white text by default in both light and dark terminal profiles.

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

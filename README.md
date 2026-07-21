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

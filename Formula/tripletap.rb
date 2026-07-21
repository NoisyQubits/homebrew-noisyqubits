# Homebrew formula for TripleTap.
#
# This is NOT for homebrew-core (it links a private Apple framework and is a
# personal tool). Ship it from the NoisyQubits org tap instead:
#
#   Users install with:
#     brew tap noisyqubits/noisyqubits
#     brew trust noisyqubits/noisyqubits   # required once for third-party taps
#     brew install tripletap
#     brew services start tripletap        # run in background, start at login
#
# To bump the version: cut a new tag on NoisyQubits/TripleTap, then update the
# `url` and `sha256` below with:
#   curl -sL https://github.com/NoisyQubits/TripleTap/archive/refs/tags/vX.Y.Z.tar.gz | shasum -a 256
class Tripletap < Formula
  desc "Three-finger-click Play/Pause for the macOS trackpad"
  homepage "https://github.com/NoisyQubits/TripleTap"
  license "MIT"
  url "https://github.com/NoisyQubits/TripleTap/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "0a0b707d6c5e97934c415ed8bc4bc6614d52de25d2d31408be60fcec6828e245"
  head "https://github.com/NoisyQubits/TripleTap.git", branch: "main"

  depends_on :macos
  depends_on xcode: ["16.0", :build]

  def install
    system "swift", "build", "--configuration", "release", "--disable-sandbox"
    bin.install ".build/release/tripletap"
  end

  service do
    run [opt_bin/"tripletap", "--listen"]
    keep_alive true
    log_path var/"log/tripletap.log"
    error_log_path var/"log/tripletap.log"
  end

  test do
    # `--layout` prints the record layout and exits without touching hardware.
    assert_match "MTTouch stride", shell_output("#{bin}/tripletap --layout")
  end
end

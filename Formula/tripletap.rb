# Homebrew formula for TripleTap.
#
# This is NOT for homebrew-core (it links a private Apple framework and is a
# personal tool). Ship it from the NoisyQubits org tap instead:
#
#   1. Create a public repo named  homebrew-noisyqubits  under the org.
#   2. Put this file at            Formula/tripletap.rb  in that repo.
#   3. Users then run:
#        brew tap noisyqubits/noisyqubits
#        brew install --HEAD tripletap
#        brew services start tripletap     # run in background, start at login
#
# This formula is head-only until you cut a release. Users install with:
#   brew install --HEAD tripletap
#
# To enable plain `brew install tripletap`, push a tag and uncomment the
# stable block below:
#   git tag v0.1.0 && git push --tags
#   curl -sL https://github.com/NoisyQubits/TripleTap/archive/refs/tags/v0.1.0.tar.gz | shasum -a 256
class Tripletap < Formula
  desc "Three-finger-click Play/Pause for the macOS trackpad"
  homepage "https://github.com/NoisyQubits/TripleTap"
  head "https://github.com/NoisyQubits/TripleTap.git", branch: "main"

  # url "https://github.com/NoisyQubits/TripleTap/archive/refs/tags/v0.1.0.tar.gz"
  # sha256 "REPLACE_WITH_TARBALL_SHA256"

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

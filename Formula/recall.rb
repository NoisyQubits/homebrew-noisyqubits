# Homebrew formula for Recall.
#
# Recall is distributed from the NoisyQubits personal tap rather than
# homebrew-core because it is a shell plugin with terminal-specific ZLE
# integration.
class Recall < Formula
  desc "History-backed predictive command suggestions for Zsh"
  homepage "https://github.com/NoisyQubits/recall"
  url "https://github.com/NoisyQubits/recall/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "e4a9b35378002662ab4c7c263e2b68578a595e0b36b6c26ee8874f25496481ce"
  license "MIT"
  head "https://github.com/NoisyQubits/recall.git", branch: "main"

  def install
    libexec.install "lib", "recall.plugin.zsh", "zpredict.plugin.zsh"
    (libexec / "bin").install "bin/recall", "bin/zpredict"
    bin.install_symlink libexec / "bin/recall" => "recall"
    bin.install_symlink libexec / "bin/zpredict" => "zpredict"
  end

  def caveats
    <<~EOS
      Add Recall to Zsh by putting this line in ~/.zshrc:

        source "#{opt_prefix}/libexec/recall.plugin.zsh"

      Then start a new shell. ListView is active by default; no function key
      or Ctrl-X press is required.
    EOS
  end

  test do
    assert_match "recall #{version}", shell_output("#{bin}/recall version")
    assert_match "Usage: recall", shell_output("#{bin}/recall help")
  end
end

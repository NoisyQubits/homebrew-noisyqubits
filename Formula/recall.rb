# Homebrew formula for Recall.
#
# Recall is distributed from the NoisyQubits personal tap rather than
# homebrew-core because it is a shell plugin with terminal-specific ZLE
# integration.
class Recall < Formula
  desc "History-backed predictive command suggestions for Zsh"
  homepage "https://github.com/NoisyQubits/recall"
  url "https://github.com/NoisyQubits/recall/releases/download/v0.2.0/recall-0.2.0.tar.gz"
  sha256 "791bbaf5fbf4b9c1502f9d73b430ffe0347601f07c237dac742853cf9c6b9f1f"
  license "MIT"
  head "https://github.com/NoisyQubits/recall.git", branch: "main"

  def install
    libexec.install "lib", "tests", "recall.plugin.zsh"
    (libexec / "bin").install "bin/recall"
    bin.install_symlink libexec / "bin/recall" => "recall"
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
    style = shell_output <<~EOS
      env -u RECALL_SELECTED_STYLE zsh -f -c 'source "#{libexec}/recall.plugin.zsh";
      print -r -- "$RECALL_SELECTED_STYLE"'
    EOS
    assert_equal "bg=8,fg=15,bold\n", style
  end
end

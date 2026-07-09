class ClaudeStatusLine < Formula
  desc "Status line renderer for Claude Code"
  homepage "https://github.com/lawther/claude_status_line"
  version "0.3.2"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/lawther/claude_status_line/releases/download/claude_status_line-v#{version}/claude_status_line-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "2502b968dfec93ef0ea93812500f3f5dac027f7f23095e0755bf29dd2e5b8ffe"
    elsif Hardware::CPU.arm?
      url "https://github.com/lawther/claude_status_line/releases/download/claude_status_line-v#{version}/claude_status_line-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "94b5f18376206069cc1031c1c4f04d75d2164a2128179b3e2207db68f202ec61"
    end
  end

  def install
    bin.install "claude_status_line"
  end

  def caveats
    <<~EOS
      To register the status line in Claude Code, run:
        claude_status_line --install --link

      Using the --link flag ensures Claude Code references the Homebrew-managed
      binary path directly, allowing 'brew upgrade' to apply updates automatically.
    EOS
  end

  test do
    system "#{bin}/claude_status_line", "--help"
  end
end

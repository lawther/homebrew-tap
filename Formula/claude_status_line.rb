class ClaudeStatusLine < Formula
  desc "Status line renderer for Claude Code"
  homepage "https://github.com/lawther/claude_status_line"
  version "claude_status_line-v0.3.0"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/lawther/claude_status_line/releases/download/v#{version}/claude_status_line-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "723acd1106e2a96c4de1b3952396eefefd0213ec4ebe5038417c9e30a2f508fc"
    elsif Hardware::CPU.arm?
      url "https://github.com/lawther/claude_status_line/releases/download/v#{version}/claude_status_line-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "7d58e471e7e820b4d393112c5c385f69931f75ac6e62ee985bc82953acd82796"
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

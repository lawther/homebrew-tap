class ClaudeStatusLine < Formula
  desc "Status line renderer for Claude Code"
  homepage "https://github.com/lawther/claude_status_line"
  version "0.5.0"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/lawther/claude_status_line/releases/download/claude_status_line-v#{version}/claude_status_line-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "9ac2dfb63d26b92992eb20cc0b501b2ad8ca48251ad3b9cdfd5ffd857be1a1b3"
    elsif Hardware::CPU.arm?
      url "https://github.com/lawther/claude_status_line/releases/download/claude_status_line-v#{version}/claude_status_line-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "c76963e3a6f66a41e157ecda385f44ae5da09efb1be9c03d63755d53c92231d1"
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

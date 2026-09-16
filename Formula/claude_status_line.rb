class ClaudeStatusLine < Formula
  desc "Status line renderer for Claude Code"
  homepage "https://github.com/lawther/claude_status_line"
  version "0.4.0"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/lawther/claude_status_line/releases/download/claude_status_line-v#{version}/claude_status_line-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "58c2e622f02eb8fe8729a5433f4dcab973c680032529213dc3b4f205c0b0d0e9"
    elsif Hardware::CPU.arm?
      url "https://github.com/lawther/claude_status_line/releases/download/claude_status_line-v#{version}/claude_status_line-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "cef2c5afe6c02d32d0bdbc1a88f34879101c028da84216267e042f45cf1f4cc6"
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

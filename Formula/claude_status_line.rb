class ClaudeStatusLine < Formula
  desc "Status line renderer for Claude Code"
  homepage "https://github.com/lawther/claude_status_line"
  version "0.3.1"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/lawther/claude_status_line/releases/download/claude_status_line-v#{version}/claude_status_line-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "3a5fd1d0fb00d6dccfaedd4460f8c71d26c5ff7ea41a2f9d930af1676d03b666"
    elsif Hardware::CPU.arm?
      url "https://github.com/lawther/claude_status_line/releases/download/claude_status_line-v#{version}/claude_status_line-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "b47c6f7009822a0cf60b82b0ed52c1d9936d69ac59800cca099c33ed38cb87b8"
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

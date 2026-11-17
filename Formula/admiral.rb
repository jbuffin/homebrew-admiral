class Admiral < Formula
  desc "Visual dashboard that launches coding-agent sessions and lets you watch them"
  homepage "https://github.com/jbuffin/admiral"
  url "https://github.com/jbuffin/admiral/releases/download/v1.0.2/admiral-1.0.2-darwin-arm64.tar.gz"
  sha256 "1d413c88496f6c9aa5406ccce49680b290747e43a97c8c3344a8bc1d953945cb"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "tmux"

  def install
    bin.install "admiral"
    prefix.install "LICENSE", "THIRD_PARTY_NOTICES"
  end

  def caveats
    <<~EOS
      Set up your first fleet:
        admiral setup

      Start Admiral at login and keep it running:
        admiral service install

      After `brew upgrade admiral`, restart the running service:
        launchctl kickstart -k gui/$UID/dev.jasonbuffin.admiral
    EOS
  end

  test do
    assert_match "admiral #{version}", shell_output("#{bin}/admiral --version")
  end
end

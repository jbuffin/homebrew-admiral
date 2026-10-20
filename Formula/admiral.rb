class Admiral < Formula
  desc "Visual dashboard that launches coding-agent sessions and lets you watch them"
  homepage "https://github.com/jbuffin/admiral"
  url "https://github.com/jbuffin/admiral/releases/download/v0.2.7/admiral-0.2.7-darwin-arm64.tar.gz"
  sha256 "20bed5cb696663c6cbec7947bd75a8ee7e01415bf49fe07d7c27a8f2f8c8ca83"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "python@3.15"
  depends_on "tmux"

  def install
    bin.install "admiral"
    (pkgshare/"plugins").install "plugins/freeform"
    (pkgshare/"plugins").install "plugins/github"
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

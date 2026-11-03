class Admiral < Formula
  desc "Visual dashboard that launches coding-agent sessions and lets you watch them"
  homepage "https://github.com/jbuffin/admiral"
  url "https://github.com/jbuffin/admiral/releases/download/v0.7.0/admiral-0.7.0-darwin-arm64.tar.gz"
  sha256 "9a0971d7ee63aa80e2fecd0c7150fda552b9ba0393d8b4609f844ea101992794"
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

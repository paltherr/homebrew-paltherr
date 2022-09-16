class GitRepoTools < Formula
  desc "Tools for Git repositories"
  homepage "https://github.com/paltherr/git-repo-tools"
  url "https://github.com/paltherr/git-repo-tools/archive/v0.0.0.tar.gz"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  head "https://github.com/paltherr/git-repo-tools.git", :branch => "main"
  license "MIT"

  depends_on "paltherr/zsh/zabort"
  depends_on "paltherr/zsh/zfun"

  def install
    bin.install "src/bin/gr-head-commit-amend"
    bin.install "src/bin/gr-homebrew-formula-update"
    bin.install "src/bin/gr-latest-tag"
    bin.install "src/bin/gr-latest-tag-update"
    bin.install "src/bin/gr-release-create"
    bin.install "src/bin/gr-release-delete"
    bin.install "src/bin/gr-release-notes"
    bin.install "src/bin/gr-release-tag"
    bin.install "src/bin/gr-release-tag-create"
    bin.install "src/bin/gr-release-tag-delete"
    bin.install "src/bin/gr-release-tag-update"
    bin.install "src/bin/gr-release-title"
    bin.install "src/bin/gr-release-update"
  end
end

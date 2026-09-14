class Mysq < Formula
  desc "Find slow queries, blocked transactions, and MySQL performance problems"
  homepage "https://github.com/maheshrijal/mysq"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/maheshrijal/mysq/releases/download/v0.2.0/mysq_darwin_amd64.tar.gz"
      sha256 "bf1781ed451a73ef5511ab3da81daf8825824fdb7baac80a122ac06988c68459"
    end
    on_arm do
      url "https://github.com/maheshrijal/mysq/releases/download/v0.2.0/mysq_darwin_arm64.tar.gz"
      sha256 "0acab66b0f0c9d04ec5d20ae47cd899f4915b2dd48f2f6ba902afac7cd8abac9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/maheshrijal/mysq/releases/download/v0.2.0/mysq_linux_amd64.tar.gz"
      sha256 "9c5c9b05315dc2cd2368d332c29178a1c711662bdb135a93da42340a8a77c689"
    end
    on_arm do
      url "https://github.com/maheshrijal/mysq/releases/download/v0.2.0/mysq_linux_arm64.tar.gz"
      sha256 "522c0bcbf85de82b73b58bc77f6be431af4ac481da227ac36d71677af7072fc2"
    end
  end

  on_arm do
    depends_on arch: :arm64
  end
  on_intel do
    depends_on arch: :x86_64
  end

  def install
    bin.install "mysq"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mysq --version")
    assert_match "CREATE USER IF NOT EXISTS 'brew_test'@'%'", shell_output("#{bin}/mysq init --user brew_test")
  end
end

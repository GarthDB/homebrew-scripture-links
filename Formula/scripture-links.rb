class ScriptureLinks < Formula
  desc "Convert scripture references to URLs for ChurchofJesusChrist.org"
  homepage "https://github.com/GarthDB/scripture-links"
  version "1.2.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GarthDB/scripture-links/releases/download/v1.2.3/scripture-links-aarch64-apple-darwin.tar.gz"
      sha256 "3dc4cef3d8d4e605a87ad5abf7ae7bc95b65fc7823265ab7976331af1167b271"
    else
      url "https://github.com/GarthDB/scripture-links/releases/download/v1.2.3/scripture-links-x86_64-apple-darwin.tar.gz"
      sha256 "8ac25a9434748b4d922e893475e5217a52417d738a54535d537b32509c1c8aee"
    end
  end

  on_linux do
    url "https://github.com/GarthDB/scripture-links/releases/download/v1.2.3/scripture-links-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "cb8cbe55d03a0eb7a8327bdd9f1b8ba96aa37a78d71dbf15db7ca98dc5c7fc81"
  end

  def install
    bin.install "scripture-links"
  end

  test do
    output = shell_output("#{bin}/scripture-links --reference 'Genesis 1:1'")
    assert_match "https://www.churchofjesuschrist.org/study/scriptures/ot/gen/1", output

    help_output = shell_output("#{bin}/scripture-links --help")
    assert_match "Generate links to scriptures on ChurchofJesusChrist.org", help_output
  end
end

class ScriptureLinks < Formula
  desc "Convert scripture references to URLs for ChurchofJesusChrist.org"
  homepage "https://github.com/GarthDB/scripture-links"
  version "1.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GarthDB/scripture-links/releases/download/v1.2.2/scripture-links-aarch64-apple-darwin.tar.gz"
      sha256 "bd2d9e92cd1a31c3b1b23ac7743e612f2b6e0ae0cede94903233a6c663b9c5d5"
    else
      url "https://github.com/GarthDB/scripture-links/releases/download/v1.2.2/scripture-links-x86_64-apple-darwin.tar.gz"
      sha256 "30c5d3fb2ccce1bb976cbcb3f5e77b7cfb5bea325d48d6581510c6d324342120"
    end
  end

  on_linux do
    url "https://github.com/GarthDB/scripture-links/releases/download/v1.2.2/scripture-links-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3284fe2f3c927dc9103a92b031bd76cf2d8bc427762e8805c14bf9d80b93b56b"
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

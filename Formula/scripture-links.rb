class ScriptureLinks < Formula
  desc "Convert scripture references to URLs for ChurchofJesusChrist.org"
  homepage "https://github.com/GarthDB/scripture-links"
  version "2.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GarthDB/scripture-links/releases/download/v2.0.0/scripture-links-aarch64-apple-darwin.tar.gz"
      sha256 "1bc261a423161273566f91a9706888616620437f1f5127b890e60da4156c1c58"
    else
      url "https://github.com/GarthDB/scripture-links/releases/download/v2.0.0/scripture-links-x86_64-apple-darwin.tar.gz"
      sha256 "58780dbdba952d7cf35189aa4aa771a63142661fb84c87354061423b48f296ad"
    end
  end

  on_linux do
    url "https://github.com/GarthDB/scripture-links/releases/download/v2.0.0/scripture-links-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "badc658c69d6e0676fb8d168bb8f916f987844644ea8e5b7cdb97f53e901930c"
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

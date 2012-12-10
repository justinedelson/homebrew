require 'formula'

class Filevault < Formula
  homepage 'http://dev.day.com/docs/en/crx/current/how_to/how_to_use_the_vlttool.html'
  url 'http://repo.adobe.com/archiva/repository/day-central/com/day/jcr/vault/vault-cli/2.4.34/vault-cli-2.4.34-assembly.tar.gz'
  md5 'cd5ff574979b3edf702e75675e04d139'
  version '2.4.34'

  def install
    # Remove windows files
    rm_f Dir["bin/*.bat"]
    
    libexec.install %w[bin lib]

    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  def test
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test vault`.
    system "vlt"
  end
end

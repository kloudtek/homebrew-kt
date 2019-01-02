class AnypointTools < Formula
  desc "Library and command-line to interact with mulesoft anypoint"
  homepage "https://github.com/Kloudtek/anypoint-tools"
  url "https://github.com/kloudtek/anypoint-tools/archive/0.9.38.tar.gz"
  sha256 "86e93fde814ec90b50ab59e85aad85d0733e4ba0837b597ec15bd06ebeec04d0"
  depends_on :java => "1.8+"
  def install
    system "sh", "mvnw", "package"
    system "rm", "-rf", "lib"
    system "tar", "-v","-xf", "cli/target/anypoint-cli-0.9.38-dist.tbz2"
    libexec.install "bin", "lib", "README.md"
    bin.write_exec_script libexec/"bin/anypoint"
  end
  test do
    system "#{bin}/anypoint"
  end
end

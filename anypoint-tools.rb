class AnypointTools < Formula
  desc "Library and command-line to interact with mulesoft anypoint"
  homepage "https://github.com/Kloudtek/anypoint-tools"
  url "https://github.com/kloudtek/anypoint-tools/archive/0.9.38.tar.gz"
  sha256 "6f32768f4b38acdc0295a1630df6ed07013713854c2051ab25d4ed31274ed7b7"
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

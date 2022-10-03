# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class AwsOkta < Formula
  desc "aws-vault like tool for Okta authentication"
  homepage "https://github.com/skyzyx/aws-okta/"
  revision 1
  head "https://github.com/skyzyx/aws-okta.git"

  depends_on "go" => :build

  def install
    ENV.deparallelize

    mkdir_p "bin"
    
    # https://stackoverflow.com/questions/13214029/go-build-cannot-find-package-even-though-gopath-is-set
    system "go", "mod", "vendor"
    system "go", "build", "-mod=vendor", "-o", "bin", "./..."
    
    bin.install "bin/aws-okta" => "aws-okta"
  end

  test do
    assert_includes shell_output("#{bin}/aws-okta --version"),"aws-okta version"
  end
end

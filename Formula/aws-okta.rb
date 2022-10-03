# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class AwsOkta < Formula
  desc "aws-vault like tool for Okta authentication"
  homepage "https://github.com/skyzyx/aws-okta/"
  revision 1
  head "https://github.com/skyzyx/aws-okta.git"

  depends_on "go" => :build

  def install
    system "go", "mod", "vendor"
    system "go", "build", "-mod=vendor", "./..."
  end

  test do
    assert_includes shell_output("#{bin}/aws-okta --version"),"aws-okta version"
  end
end

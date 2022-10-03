# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class AwsOkta < Formula
  desc "aws-vault like tool for Okta authentication"
  homepage "https://github.com/skyzyx/aws-okta/"
  url "https://github.com/skyzyx/aws-okta/archive/refs/heads/master.tar.gz"
  # sha256 "444a84cd9c81097a7c462f806605193c5676879133255cfa0f610b7d14756b65"
  revision 1
  head "https://github.com/skyzyx/aws-okta.git"

  depends_on "go" => :build

  def install
    system "make"
  end

  test do
    assert_includes shell_output("#{bin}/aws-okta --version"),"aws-okta version"
  end
end

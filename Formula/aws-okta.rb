# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class AwsOkta < Formula
  desc "aws-vault like tool for Okta authentication"
  homepage "https://github.com/skyzyx/aws-okta/"
  url "https://github.com/skyzyx/aws-okta/archive/refs/heads/master.tar.gz"
  # sha256 "444a84cd9c81097a7c462f806605193c5676879133255cfa0f610b7d14756b65"

  depends_on "go" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    # system "./configure", *std_configure_args, "--disable-silent-rules"
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    # system "make all"
    # ENV['GOROOT'] = "/usr/local/Cellar/go@1.17/1.17.13/libexec"
    system "go", "build", *std_go_args(ldflags:"-s -w -X main.Version=#{version}")
    # bin.install "aws-okta"
    # prefix.install Dir['*']
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test aws-okta`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    #system "false"
    assert_includes shell_output("#{bin}/aws-okta --version"),"aws-okta version"
  end
end

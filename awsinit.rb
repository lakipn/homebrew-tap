class Awsinit < Formula
  desc "Interactive AWS profile switcher with MFA and SSO support"
  homepage "https://github.com/lakipn/aws-profile-switcher"
  url "https://github.com/lakipn/aws-profile-switcher/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "f522c05edc40b0d5241818e7fae8c0d3ab292dacbea4814deacc2c006317531f"
  license "MIT"
  version "1.0.0"

  depends_on "awscli"

  def install
    bin.install "awsinit"
    prefix.install "awsinit-wrapper.sh"
  end

  def caveats
    <<~EOS
      To enable the awsinit wrapper function, add this to your shell config:

      For bash (~/.bashrc or ~/.bash_profile):
        source #{prefix}/awsinit-wrapper.sh

      For zsh (~/.zshrc):
        source #{prefix}/awsinit-wrapper.sh

      For fish (~/.config/fish/config.fish):
        Fish users should create a function manually. See:
        https://github.com/lakipn/aws-profile-switcher#installation

      For MFA support, install aws-mfa:
        pip install aws-mfa
    EOS
  end

  test do
    assert_match "AWS Profile Switcher", shell_output("#{bin}/awsinit 2>&1", 1)
  end
end
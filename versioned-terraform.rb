  class VersionedTerraform < Formula
  desc "Wrapper for terraform to detect, download, and execute the right version"
  homepage "https://github.com/mitch-thompson/versionedTerraform"
  version "1.2.4"

  on_macos do
    on_arm do
      url "https://github.com/mitch-thompson/versionedTerraform/releases/download/1.2.4/versionedTerraform_darwin_arm64.tar.gz"
      sha256 "38678748c31952cba8c49a629497303e9395c84d69b07a59b6c429e1069ad10e"
    end
    on_intel do
      url "https://github.com/mitch-thompson/versionedTerraform/releases/download/1.2.4/versionedTerraform_darwin_amd64.tar.gz"
      sha256 "7e2306d0b2b6ba9abf4b7f0afe7d03b8d205ef5b1b8ce5a4a275fbaf555ee06b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mitch-thompson/versionedTerraform/releases/download/1.2.4/versionedTerraform_linux_arm64.tar.gz"
      sha256 "23c6aad115d76809dc4148732b2ba4ee60029992ed1e53542cd5c2c36826f71c"
    end
    on_intel do
      url "https://github.com/mitch-thompson/versionedTerraform/releases/download/1.2.4/versionedTerraform_linux_amd64.tar.gz"
      sha256 "31e505bbd8764e22d78161e323381a5b1f3708797f4930f4a012695a524de452"
    end
  end

  def install
    if OS.mac?
      binary_name = Hardware::CPU.arm? ? "versionedTerraform_darwin_arm64" : "versionedTerraform_darwin_amd64"
    else
      binary_name = Hardware::CPU.arm? ? "versionedTerraform_linux_arm64" : "versionedTerraform_linux_amd64"
    end

    bin.install binary_name => "versionedTerraform"
  end

  test do
    system "#{bin}/versionedTerraform", "--help"
  end
end

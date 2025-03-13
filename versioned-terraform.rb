class VersionedTerraform < Formula
  desc "Wrapper for terraform to detect, download, and execute the right version"
  homepage "https://github.com/mitch-thompson/versionedTerraform"
  version "1.2.4"

  on_macos do
    on_arm do
      url "https://github.com/mitch-thompson/versionedTerraform/releases/download/1.2.4/versionedTerraform_darwin_arm64.tar.gz"
      sha256 "03977d4f2c33d559299d30ad009016d19acaace834da2c9f2bae6069f41d68c9"
    end
    on_intel do
      url "https://github.com/mitch-thompson/versionedTerraform/releases/download/1.2.4/versionedTerraform_darwin_amd64.tar.gz"
      sha256 "e61de3b94bf399c1a3552ee1a6ea023ec2643d2ba3b525b2f725a4ccb0ac6df8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mitch-thompson/versionedTerraform/releases/download/1.2.4/versionedTerraform_linux_arm64.tar.gz"
      sha256 "565cb0b2989dc8b2b12468253c80f53aea68b659993f9f61edc1a4ed7e7cabbc"
    end
    on_intel do
      url "https://github.com/mitch-thompson/versionedTerraform/releases/download/1.2.4/versionedTerraform_linux_amd64.tar.gz"
      sha256 "11d7cd120bb86aef5d1242795d6f2a88fb70607944eea47d0cf5be5f8e598a60"
    end
  end

  def install
    if OS.mac?
      binary_name = Hardware::CPU.arm? ? "versionedTerraform_darwin_arm64" : "versionedTerraform_darwin_amd64"
    else
      binary_name = Hardware::CPU.arm? ? "versionedTerraform_linux_arm64" : "versionedTerraform_linux_amd64"
    end

    bin.install binary_name => "versionedterraform"
  end

  test do
    system "#{bin}/versionedterraform", "--help"
  end
end

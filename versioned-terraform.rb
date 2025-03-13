  class VersionedTerraform < Formula
  desc "Wrapper for terraform to detect, download, and execute the right version"
  homepage "https://github.com/mitch-thompson/versionedTerraform"
  version "1.2.4"

  on_macos do
    on_arm do
      url "https://github.com/mitch-thompson/versionedTerraform/releases/download/1.2.4/versionedTerraform_darwin_arm64.tar.gz"
      sha256 "007deef4ba453bfd2ca47bf484e7c4d9d9d83f63fba13e0226e9fc0c3e21c239"
    end
    on_intel do
      url "https://github.com/mitch-thompson/versionedTerraform/releases/download/1.2.4/versionedTerraform_darwin_amd64.tar.gz"
      sha256 "f61ddb578708fdeb375e8f159fab8a3aed83640f4bf88fee6dce8b8e900d6ae4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mitch-thompson/versionedTerraform/releases/download/1.2.4/versionedTerraform_linux_arm64.tar.gz"
      sha256 "7ed3228b2a01dd7b5cfda102f0fdd218d6b871a2c8cd966e0f936aca51c0fddd"
    end
    on_intel do
      url "https://github.com/mitch-thompson/versionedTerraform/releases/download/1.2.4/versionedTerraform_linux_amd64.tar.gz"
      sha256 "8fe6960c07ab6853b5d99816a2daed93053ece1e0c79305db1313d7c169ed8b0"
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

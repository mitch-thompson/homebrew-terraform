class VersionedTerraform < Formula
  desc "Wrapper for versionedTerraform to detect, download, and execute the right version"
  homepage "https://github.com/mitch-thompson/versionedTerraform"

  version "1.2.4"

  on_macos do
    on_arm do
      url "https://github.com/mitch-thompson/versionedTerraform/releases/download/#{version}/versionedTerraform_darwin_arm64.tar.gz"
      sha256 "1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef"
    end
    on_intel do
      url "https://github.com/mitch-thompson/versionedTerraform/releases/download/#{version}/versionedTerraform_darwin_amd64.tar.gz"
      sha256 "0987654321fedcba0987654321fedcba0987654321fedcba0987654321fedcba"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mitch-thompson/versionedTerraform/releases/download/#{version}/versionedTerraform_linux_arm64.tar.gz"
      sha256 "abcdef1234567890abcdef1234567890abcdef1234567890abcdef1234567890"
    end
    on_intel do
      url "https://github.com/mitch-thompson/versionedTerraform/releases/download/#{version}/versionedTerraform_linux_amd64.tar.gz"
      sha256 "fedcba0987654321fedcba0987654321fedcba0987654321fedcba0987654321"
    end
  end

  def install
    binary_name = nil

    if OS.mac?
      binary_name = Hardware::CPU.arm? ? "versionedTerraform_darwin_arm64" : "versionedTerraform_darwin_amd64"
    elsif OS.linux?
      binary_name = Hardware::CPU.arm? ? "versionedTerraform_linux_arm64" : "versionedTerraform_linux_amd64"
    end

    bin.install binary_name => "versionedTerraform"
  end

  test do
    system "#{bin}/versionedTerraform", "--help"
  end
end
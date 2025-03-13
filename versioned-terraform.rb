  class VersionedTerraform < Formula
  desc "Wrapper for terraform to detect, download, and execute the right version"
  homepage "https://github.com/mitch-thompson/versionedTerraform"
  version "1.2.4"

  on_macos do
    on_arm do
      url "https://github.com/mitch-thompson/versionedTerraform/releases/download/1.2.4/versionedTerraform_darwin_arm64.tar.gz"
      sha256 "b2b9beff5e25608345945166af76dc342aea4d7a00b2e118f1576ef2d3f12e65"
    end
    on_intel do
      url "https://github.com/mitch-thompson/versionedTerraform/releases/download/1.2.4/versionedTerraform_darwin_amd64.tar.gz"
      sha256 "7a43adb7324ad96a04283264517fac22196bd8ac98381cbf1893c5b232eddffe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mitch-thompson/versionedTerraform/releases/download/1.2.4/versionedTerraform_linux_arm64.tar.gz"
      sha256 "39cd81930dba93253ef720080b311dc1075bbfc7a12fd8998154be8de856cecb"
    end
    on_intel do
      url "https://github.com/mitch-thompson/versionedTerraform/releases/download/1.2.4/versionedTerraform_linux_amd64.tar.gz"
      sha256 "5e891a3b0c9d1c72d547054760907db9082804305d7fa7222147e8b231661f03"
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

class Lastfmfpclient < Formula
  homepage "https://github.com/lastfm/Fingerprinter"
  url "https://github.com/lastfm/Fingerprinter/archive/b728727219968c8a0c37.tar.gz"
  version "1.6.1"
  sha256 "d22b114b88cf681b9430ded92baa56869aed0afb381eece741b96409b369108c"

  depends_on "cmake" => :build
  depends_on "taglib"
  depends_on "fftw"
  depends_on "mad"
  depends_on "libsamplerate"

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end
end

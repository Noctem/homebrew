class Uim < Formula
  homepage "https://github.com/uim/uim"
  url "https://uim.googlecode.com/files/uim-1.6.0.tar.bz2"
  sha256 "2a34dca2091eb6d61f05dabd8512c6658d8cefa8db14b7a684fbb10caea4a3aa"

  head do
    url "https://github.com/uim/uim.git"
    depends_on "intltool"
  end

  depends_on "pkg-config" => :build
  depends_on "gettext"

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
  end
end

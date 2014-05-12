require 'formula'

class Libquvi < Formula
  homepage 'http://quvi.sourceforge.net/'
  url 'http://sourceforge.net/projects/quvi/files/0.9/libquvi/libquvi-0.9.4.tar.xz/download'
  sha1 'f7577530e00a07c7decdaf7a352f437da413bcdb'

  depends_on 'pkg-config' => :build
  depends_on 'lua'
  depends_on 'libproxy'
  depends_on 'glib'

  resource 'scripts' do
    url 'http://downloads.sourceforge.net/project/quvi/0.9/libquvi-scripts/libquvi-scripts-0.9.20131130.tar.xz'
    sha1 '41f059964c8f47aeb241cc53b883592b5db77e53'
  end

  def install
    scripts = prefix/'libquvi-scripts'
    resource('scripts').stage do
      system "./configure", "--prefix=#{scripts}", "--with-nsfw"
      system "make install"
    end
    ENV.append_path 'PKG_CONFIG_PATH', "#{scripts}/lib/pkgconfig"

    # Lua 5.2 does not have a proper lua.pc
    ENV['liblua_CFLAGS'] = ' '
    ENV['liblua_LIBS'] = '-llua'

    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make install"
  end
end

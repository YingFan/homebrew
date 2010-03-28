require 'formula'

class Libnotify <Formula
  url 'http://www.galago-project.org/files/releases/source/libnotify/libnotify-0.4.5.tar.bz2'
  homepage 'http://www.galago-project.org'
  md5 ''

  depends_on 'dbus-glib'
  depends_on 'gtk+'

  def install
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make install"
  end
end

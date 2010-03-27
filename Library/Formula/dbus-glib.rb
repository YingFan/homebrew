require 'formula'

class DbusGlib <Formula
  url 'http://dbus.freedesktop.org/releases/dbus-glib/dbus-glib-0.86.tar.gz'
  homepage 'http://www.freedesktop.org/wiki/Software/DBusBindings'
  md5 'cd0ab148fb0c786fc88be49d19971f50'

  depends_on 'dbus'
  depends_on 'gettext'

  def install
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make install"
  end
end

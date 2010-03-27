require 'formula'

class Libglade <Formula
  url 'http://ftp.gnome.org/pub/GNOME/sources/libglade/2.6/libglade-2.6.4.tar.bz2'
  homepage 'http://www.gnome.org'
  md5 'd1776b40f4e166b5e9c107f1c8fe4139'

 depends_on 'gtk+'

  def install
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make install"
  end
end

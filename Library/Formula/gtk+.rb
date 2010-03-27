require 'formula'

class Gtkx <Formula
  url 'http://ftp.gnome.org/pub/gnome/sources/gtk+/2.18/gtk+-2.18.9.tar.bz2'
  homepage 'http://www.gnome.org'
  sha256 '5dcd8c406acbb8779c0b081a089fa87dfd7ab4d7d4c6075db478997ce96aa9b4'

  depends_on 'glib'
  depends_on 'atk'
  depends_on 'cairo'
  depends_on 'pango'
  depends_on 'libpng' => :recommended
  depends_on 'libjpeg' => :recommended
  depends_on 'libtiff' => :recommended

  def install
    system "./configure", "--disable-gtk-doc-html", "--disable-rebuilds", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make install"
  end
end

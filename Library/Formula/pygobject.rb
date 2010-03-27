require 'formula'

class Pygobject <Formula
  url 'http://ftp.gnome.org/pub/GNOME/sources/pygobject/2.20/pygobject-2.20.0.tar.bz2'
  homepage 'http://www.pygtk.org'
  sha256 '41e923a3f4426a3e19f6d154c424e3dac6f39defca77af602ac6272ce270fa81'

# Pip fails to install

  depends_on 'glib'
  depends_on 'libffi' => :optional

  def install
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make install"
  end
end

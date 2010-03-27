require 'formula'

class Librsvg <Formula
  url 'http://ftp.gnome.org/pub/GNOME/sources/librsvg/2.26/librsvg-2.26.0.tar.bz2'
  homepage 'http://librsvg.sourceforge.net/'
  md5 '65dbd726a514fe8b797d26254b8efc1e'

  depends_on 'gtk+'
  depends_on 'libcroco' => :recommended
  depends_on 'libgsf' => :recommended 

  def install
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make install"
  end
end

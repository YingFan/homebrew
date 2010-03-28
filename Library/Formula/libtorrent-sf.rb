require 'formula'

class LibtorrentSf <Formula
  url 'http://downloads.sourceforge.net/project/libtorrent/libtorrent/libtorrent-rasterbar-0.15.0.tar.gz'
  homepage 'http://www.rasterbar.com/products/libtorrent/index.html'
  md5 '3f8253457557a3f4778fa18fa076c5c9'

  depends_on 'boost'
  depends_on 'libgeoip' => :optional


  def install

    configure_args = ["--enable-python-binding", "--disable-dependency-tracking", "--prefix=#{prefix}"]

    configure_args << "--with-libgeoip" if Formula.factory('geoip').installed?
                    
    system "./configure", *configure_args
    system "make install"
    system "python setup.py build"
    system "python setup.py install --prefix=#{prefix}"
  end
end

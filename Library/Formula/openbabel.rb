require 'formula'

class Openbabel <Formula
  url 'http://downloads.sourceforge.net/project/openbabel/openbabel/2.2.3/openbabel-2.2.3.tar.gz'
  homepage 'http://openbabel.org'
  md5 '7ea8845c54d6d3a9be378c78088af804'

  depends_on 'libxml2'

  def install
    configure_args = ["--disable-dependency-tracking", 
                       "--prefix=#{prefix}",
                       "--with-xml-prefix=#{Formula.factory('libxml2').prefix}"]

    system "./configure", *configure_args
    system "make install"
  end
end

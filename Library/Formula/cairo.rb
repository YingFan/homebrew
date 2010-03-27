require 'formula'

class Cairo <Formula
  url 'http://www.cairographics.org/releases/cairo-1.8.10.tar.gz'
  homepage 'http://www.cairographics.org'
  sha1 'fd5e8ca82ff0e8542ea4c51612cad387f2a49df3'

  depends_on 'pkg-config'

  def install
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make install"
  end
end

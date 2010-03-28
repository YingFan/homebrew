require 'formula'

class Pycairo <Formula
  url 'http://cairographics.org/releases/pycairo-1.8.8.tar.gz'
  homepage 'http://cairographics.org/pycairo'
  md5 '054da6c125cb427a003f5fd6c54f853e'

  # Pip not working

  def install
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make install"
  end
end

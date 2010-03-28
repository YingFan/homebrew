require 'formula'

class Fftw3 <Formula
  @homepage='http://www.fftw.org'
  @url='http://www.fftw.org/fftw-3.2.2.tar.gz'
  @md5='b616e5c91218cc778b5aa735fefb61ae'

  def install
    system "./configure", "--enable-shared",
                          "--disable-debug",
                          "--prefix=#{prefix}",
                          "--enable-threads",
                          "--enable-sse2",
                          "--disable-dependency-tracking"
    system "make install"

    #wtf file?
    (prefix+'share'+'info'+'dir').unlink
  end
end

require 'formula'

class Libao <Formula
  @url='http://downloads.xiph.org/releases/ao/libao-1.0.0.tar.gz'
  @md5='08283fbe1f587619053a156254afecec'
  @homepage='http://www.xiph.org/ao/'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}", "--disable-x"
    system "make install"
  end
end

require 'formula'

class XdgUtils <Formula
  url 'http://portland.freedesktop.org/download/xdg-utils-1.0.2.tgz'
  homepage 'http://portland.freedesktop.org'
  md5 '348a5b91dc66426505022c74a64b2940'

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make install"
  end
end

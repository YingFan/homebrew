require 'formula'

class Grace <Formula
  url 'ftp://plasma-gate.weizmann.ac.il/pub/grace/src/stable/grace-5.1.22.tar.gz'
  homepage 'http://plasma-gate.weizmann.ac.il/Grace/'
  md5 '672356466f18fe59ed21a8fb44f9851d'

  # openmotif seems to be more up to date than lesstif
  depends_on 'openmotif'

  def install
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make install"
  end
end

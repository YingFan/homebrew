require 'formula'

class Pygtk <Formula
  url 'http://ftp.gnome.org/pub/GNOME/sources/pygtk/2.17/pygtk-2.17.0.tar.bz2'
  homepage 'http://www.pygtk.org'
  md5 ''

# Pip won't work
  depends_on 'pygobject'
  depends_on 'pycairo'

  def install
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make install"
  end

  def caveats; <<-EOS
pygobject, pycairo and pygtk can't be installed via disttools.

export PYTHON_PATH=#{HOMEBREW_PREFIX}/lib/python:$PYTHON_PATH
in your .profile is a possible workaround
EOS
  end
end

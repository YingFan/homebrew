require 'formula'

class Deluge <Formula
  url 'http://download.deluge-torrent.org/source/deluge-1.2.2.tar.bz2'
  homepage 'http://deluge-torrent.org'
  md5 '535f65ef9854073189c9fb604a673c9f'

# No Leopard at hand to test on but should work with python 2.5 as well
# http://dev.deluge-torrent.org/wiki/Installing/Source
  unless MACOS_VERSION >= 10.6 # or Formula.factory('python').installed?
     puts 'Snow Leopard and/or python2.6 needed' 
     exit
  end

  depends_on 'chardet' => :python
# Seems pip can't find http://www.freedesktop.org/~lanius/pyxdg-0.19.tar.gz
  depends_on 'xdg' => :python
  depends_on 'mako' => :python
  
  # From gentoo pygame ebuild
  depends_on 'sdl_image' 
  depends_on 'sdl_mixer'
  depends_on 'sdl_ttf'
  depends_on 'smpeg'
# Serious hazzle, try patch from macports, then 
# LOCALBASE='/usr/local' python config.py and manual install
  depends_on 'pygame' => :python

  depends_on 'pygtk'
  depends_on 'twisted' => :python

  depends_on 'libnotify'
  depends_on 'notify' => :python

  depends_on 'gettext'
  depends_on 'geoip' => :optional
  depends_on 'boost'
  depends_on 'xdg-utils'

  def install
    # try temporary pythonpath until links are made
    ENV['PYTHONPATH'] = "#{prefix}/lib/python2.6/site-packages/"
    system "python setup.py build"
    system "python setup.py install --prefix=#{prefix}"
  end
end

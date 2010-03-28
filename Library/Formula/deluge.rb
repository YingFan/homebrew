require 'formula'

class Deluge <Formula
  url 'http://download.deluge-torrent.org/source/deluge-1.2.3.tar.bz2'
  homepage 'http://deluge-torrent.org'
  md5 'f1dbc8734c1881b115b98f572e523a4d'

# Got no Leopard test on but should work with python 2.5 with a few extra deps
# http://dev.deluge-torrent.org/wiki/Installing/Source
  unless MACOS_VERSION >= 10.6 # or Formula.factory('python').installed?
     puts 'Snow Leopard and/or python2.6 needed' 
     exit
  end

  depends_on 'chardet' => :python
# Seems pip can't find http://www.freedesktop.org/~lanius/pyxdg-0.19.tar.gz
  depends_on 'xdg' => :python
  depends_on 'mako' => :python
  
# These deps from gentoo pygame ebuild
  depends_on 'sdl_image' 
  depends_on 'sdl_mixer'
  depends_on 'sdl_ttf'
  depends_on 'smpeg'

# Serious hazzle, I had to download it, install patch from macports, then
# LOCALBASE='/usr/local' python config.py and so on
  depends_on 'pygame' => :python

  depends_on 'pygtk'
  depends_on 'twisted' => :python

  depends_on 'libnotify'
# python-notify
  depends_on 'notify' => :python

  depends_on 'gettext'
  depends_on 'geoip' => :optional

# Not to be confused with "other" libtorrent 
  depends_on 'libtorrent-sf'
  depends_on 'xdg-utils'

  def install
    # Trick the .pth check until links are made
    ENV['PYTHONPATH'] = "#{prefix}/lib/python2.6/site-packages/"
    system "python setup.py build"
    system "python setup.py install --prefix=#{prefix}"
  end
end

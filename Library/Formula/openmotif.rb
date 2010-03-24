require 'formula'

class Openmotif <Formula
  url 'http://www.openmotif.org/files/public_downloads/openmotif/2.3/2.3.3/openmotif-2.3.3.tar.gz'
  homepage 'http://www.openmotif.org/'
  md5 'fd27cd3369d6c7d5ef79eccba524f7be'


  def options
    [
      ['--disable-jpeg', 'Disable JPEG support'],
      ['--disable-png', 'Disable PNG support']
    ]
  end
    
# Switched logic to include these deps by default since needing
# them is more common than not (and openmotif has them enabled
# by default

  depends_on 'libpng' unless ARGV.include? '--disable-png'
  depends_on 'libjpeg' unless ARGV.include? '--disable-jpeg'

  def install
    configure_args = [
      "--prefix=#{prefix}",
      "--disable-dependency-tracking",
    ]

    configure_args << "--disable-jpeg" if ARGV.include? '--disable-jpeg'
    configure_args << "--disable-png" if ARGV.include? '--disable-png'

    system "./configure", *configure_args
    system "make install"
  end
end

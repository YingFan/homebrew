require 'formula'

class Openmotif <Formula
  url 'http://www.openmotif.org/files/public_downloads/openmotif/2.3/2.3.3/openmotif-2.3.3.tar.gz'
  homepage 'http://www.openmotif.org/'
  md5 'fd27cd3369d6c7d5ef79eccba524f7be'
  
  def patches
    # http://bugs.motifzone.net/show_bug.cgi?id=1479
    { :p0 => DATA }
  end
  
  def options
    [
     ['--disable-jpeg', 'Disable JPEG support'],
     ['--disable-png', 'Disable PNG support']
    ]
  end
    
  depends_on 'pkg-config'
  
  #openmotif has jpeg and png enabled by default
  depends_on 'libpng' unless ARGV.include? '--disable-png'
  depends_on 'libjpeg' unless ARGV.include? '--disable-jpeg'
  
  def install
    # Possibly only client/uil/Makefile needs to be -j1
    ENV.deparallelize
    
    configure_args = [
      "--prefix=#{prefix}",
      "--disable-dependency-tracking",
    ]

    configure_args << "--disable-jpeg" if ARGV.include? '--disable-jpeg'
    configure_args << "--disable-png" if ARGV.include? '--disable-png'

    system "./configure", *configure_args
    system "make install"
  end

  def caveat; <<-EOS
There are quite some elaborate patches in fink and macports for older versions
Current formula compiles if pkg-config is installed, however it is still unknown
wheter problems previously patched now are fixed.
    EOS
  end
end

__END__
--- clients/uil/UilDefI.h  2004-11-18 16:54:32.000000000 +0800
+++ clients/uil/UilDefI.h.new       2010-03-24 21:37:32.000000000 +0800
@@ -283,7 +283,7 @@
 #include "UilIODef.h"
 #include "UilDiagDef.h"
 #include "UilSarDef.h"
-#if defined(linux)
+#if defined(linux) || defined(__APPLE__)
 #define YYSTYPE yystype
 #endif
 #include "UilLexPars.h"

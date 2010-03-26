require 'formula'

class Gcc <Formula
  url 'ftp://ftp.gnu.org/gnu/gcc/gcc-4.4.3/gcc-4.4.3.tar.bz2'
  homepage 'http://gcc.gnu.org/'
  md5 'fe1ca818fc6d2caeffc9051fe67ff103'
  
  aka 'gfortran'

  depends_on 'libiconv'
  depends_on 'gmp'
  depends_on 'mpfr'
  
  def install
    # GCC override of Homebrew environment variables needed 
    %w[CC CFLAGS CPPFLAGS CXX CXXFLAGS LD LDFLAGS].each {|flag| ENV.delete(flag)}
 
    # Make sure we don't use system libiconv 
    libiconv = Formula.factory 'libiconv'

    configure_args = ["--prefix=#{prefix}", "--with-libiconv-prefix=#{libiconv.prefix}", 
	"--enable-languages=c,c++,fortran", "--program-suffix=-4.4"]
    
    system "./configure", *configure_args
    system "make"
    system "make install"
  end
end

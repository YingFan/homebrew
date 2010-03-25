require 'formula'

class Gmp <Formula
  url 'ftp://ftp.gnu.org/gnu/gmp/gmp-5.0.1.tar.bz2'
  homepage 'http://gmplib.org/'
  md5 '6bac6df75c192a13419dfd71d19240a7'

  def options
    [
      ["--skip-check", "Do not run 'make check' to verify libraries. (Not recommended.)"]
    ]
  end

  def pathes
    # http://thread.gmane.org/gmane.comp.lib.gmp.bugs/1979
    { :p0 => DATA }
  end

  def install
    # On OS X 10.6, some tests fail under LLVM
    ENV.gcc_4_2
    
    args = ["--prefix=#{prefix}", "--infodir=#{info}", "--disable-debug", "--disable-dependency-tracking", "--enable-cxx"]

    # Doesn't compile correctly on 10.5 MacPro in 64 bit mode
    if MACOS_VERSION == 10.5 and Hardware.intel_family == :nehalem
      ENV.m32
      args << "--host=none-apple-darwin"
    end
    
    system "./configure", *args
    system "make"
    system "make install"
    
    # Different compilers and options can cause tests to fail even
    # if everything compiles, so yes, we want to do this step.
    system "make check" unless ARGV.include? "--skip-check"
  end
end

__END__
--- gmp-h.in.orig       2010-01-07 13:09:02.000000000 -0700
+++ gmp-h.in    2010-01-27 19:35:31.000000000 -0700
@@ -421,13 +421,14 @@
     GCC 4.3 and above with -std=c99 or -std=gnu99 implements ISO C99
     inline semantics, unless -fgnu89-inline is used.  */
 #ifdef __GNUC__
-#if (defined __GNUC_STDC_INLINE__) || (__GNUC__ == 4 && __GNUC_MINOR__ == 2)
+#if __GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 2)
 #define __GMP_EXTERN_INLINE extern __inline__ __attribute__ ((__gnu_inline__))
-#else
+#define __GMP_INLINE_PROTOTYPES  1
+#elif !(defined __APPLE__ && defined __MACH__ && __APPLE_CC__ >= 5465 && defined __STDC_VERSION__ && __STDC_VERSION__ >= 199901L)
 #define __GMP_EXTERN_INLINE      extern __inline__
-#endif
 #define __GMP_INLINE_PROTOTYPES  1
 #endif
+#endif
 
 /* DEC C (eg. version 5.9) supports "static __inline foo()", even in -std1
    strict ANSI mode.  Inlining is done even when not optimizing (ie. -O0

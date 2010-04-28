require 'formula'

class Gmp <Formula
  url 'ftp://ftp.gnu.org/gnu/gmp/gmp-5.0.1.tar.bz2'
  homepage 'http://gmplib.org/'
  sha1 '6340edc7ceb95f9015a758c7c0d196eb0f441d49'

  def options
    [
      ["--skip-check", "Do not run 'make check' to verify libraries. (Not recommended.)"],
      ["--32-bit", "Force 32-bit on Leopard on 64-bit machines."]
    ]
  end

  def pathes
    # http://thread.gmane.org/gmane.comp.lib.gmp.bugs/1979
    { :p0 => DATA }
  end

  def install
    # On OS X 10.6, some tests fail under LLVM
    ENV.gcc_4_2

    args = ["--prefix=#{prefix}", "--infodir=#{info}", "--enable-cxx"]

    if MACOS_VERSION == 10.5
      if Hardware.is_32_bit? or ARGV.include? "--32-bit"
        ENV.m32
        args << "--host=none-apple-darwin"
      else
        ENV.m64
      end
    end

    system "./configure", *args
    system "make"
    ENV.j1 # Don't install in parallel
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

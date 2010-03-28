require 'formula'

class Mpich2 <Formula
  url 'http://www.mcs.anl.gov/research/projects/mpich2/downloads/tarballs/1.2.1p1/mpich2-1.2.1p1.tar.gz'
  homepage 'http://www.mcs.anl.gov/research/projects/mpich2'
  md5 'fa7e8dc7c5fb60395ab26c5b239321ca'
  version '1.2.1p1'

  depends_on 'gcc' => :recommended # Gives gfortran

  gcc = Formula.factory('gcc')
  
  if gcc.installed?
     ENV['CC'] = "#{gcc.bin}/gcc-4.4"
     ENV['CXX'] = "#{gcc.bin}/g++-4.4"
     ENV['F90'] = ENV['F77'] = "#{gcc.bin}/gfortran-4.4"
  end
   
  def install
    ENV.j1
    system "./configure",  "--prefix=#{prefix}"
    system "make"
    system "make install"
  end
end

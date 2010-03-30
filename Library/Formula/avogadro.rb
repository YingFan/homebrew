require 'formula'

class Avogadro <Formula
  url 'http://downloads.sourceforge.net/project/avogadro/avogadro/1.0.0/avogadro-1.0.0.tar.bz2'
  homepage 'http://avogadro.openmolecules.net'
  md5 '1146e8ca6cafa558a373d32f38680bcf'

  depends_on 'cmake'
  depends_on 'qt'
  depends_on 'eigen'
  depends_on 'openbabel'

  def install
    system "cmake . #{std_cmake_parameters}"
    system "make install"
  end
end

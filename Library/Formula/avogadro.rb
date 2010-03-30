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
    eigen = Formula.factory 'eigen'
    openbabel = Formula.factory 'openbabel'

    FileUtils.mkdir('build')
    FileUtils.cd('build')
    
    cmake_args = "-DOPENBABEL2_LIBRARIES=#{openbabel.lib} " + "-DOPENBABEL2_INCLUDE_DIR=#{openbabel.include} "
              + "-DEIGEN2_INCLUDE_DIR=#{eigen.include} " + "-DDISABLE_UPDATE_CHECKER "
    
    system "cmake .. #{std_cmake_parameters} " + cmake_args
    system "make install"
  end
end

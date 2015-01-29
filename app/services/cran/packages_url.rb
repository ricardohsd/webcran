module Cran
  class PackagesUrl
    URL = "http://cran.r-project.org/src/contrib"

    def self.packages
      "#{URL}/PACKAGES.gz"
    end

    def self.for(name, version)
      new(name, version).url
    end

    def initialize(name = nil, version = nil)
      @name = name
      @version = version
    end

    def url
      "#{URL}/#{@name}_#{@version}.tar.gz"
    end
  end
end

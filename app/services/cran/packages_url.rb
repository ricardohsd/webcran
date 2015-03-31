module Cran
  class PackagesUrl
    URL = "cran.r-project.org"

    def self.packages
      [URL, "/src/contrib/PACKAGES.gz"]
    end

    def self.for(name, version)
      new(name, version).url
    end

    def initialize(name = nil, version = nil)
      @name = name
      @version = version
    end

    def url
      [URL, "/src/contrib/#{@name}_#{@version}.tar.gz"]
    end
  end
end

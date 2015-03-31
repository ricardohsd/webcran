module Cran
  class PackagesLinker
    def self.run!
      new.run!
    end

    def run!
      Dependency.find_each do |dependency|
        dependency.find_dependency!
      end
    end
  end
end

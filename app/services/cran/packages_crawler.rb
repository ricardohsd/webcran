module Cran
  class PackagesCrawler
    def self.fetch!
      new.fetch!
    end

    def fetch!
      packages[0...50].each do |package|
        PackageCreator.create!(package)
      end
    end

    private

    def packages
      Packages.read
    end
  end
end

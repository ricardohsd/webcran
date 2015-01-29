module Cran
  class PackagesCrawler
    def self.fetch!
      new.fetch!
    end

    def fetch!
      packages.each do |package|
        PackageCreator.create!(package)
      end
    end

    private

    def packages
      Packages.read
    end
  end
end

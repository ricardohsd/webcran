require 'rails_helper'

describe Cran::PackagesCrawler do
  describe ".fetch!" do
    it "calls PackageCreator for each package returned from Packages.read" do
      package1 = double
      package2 = double

      allow(Cran::Packages).to receive(:read).and_return([package1, package2])

      expect(Cran::PackageCreator).to receive(:create!).with(package1)
      expect(Cran::PackageCreator).to receive(:create!).with(package2)

      Cran::PackagesCrawler.fetch!
    end
  end
end

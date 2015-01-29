require 'rails_helper'

describe Cran::PackagesUrl do
  describe ".packages" do
    it "returns cran's packages url" do
      expect(Cran::PackagesUrl.packages).to eq "http://cran.r-project.org/src/contrib/PACKAGES.gz"
    end
  end

  describe ".for" do
    it "returns cran package's url" do
      expect(Cran::PackagesUrl.for("redis", "0.1.2")).to eq "http://cran.r-project.org/src/contrib/redis_0.1.2.tar.gz"
    end
  end
end

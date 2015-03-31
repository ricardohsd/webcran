require 'rails_helper'

describe Cran::PackageCreator do
  describe "#create!" do
    it "creates a a3 package" do
      VCR.use_cassette("a3_packages") do
        package = Cran::PackageCreator.create!("Package" => "A3", "Version" => "0.9.2")

        expect(package.name).to eq "A3"
        expect(package.version).to eq "0.9.2"
        expect(package.publication_date.to_s).to eq "2013-03-26 19:58:40 UTC"
        expect(package.title).to eq "A3: Accurate, Adaptable, and Accessible Error Metrics for Predictive Models"
        expect(package.description).to eq "This package supplies tools for tabulating and analyzing the results of predictive models. The methods employed are applicable to virtually any predictive model and make comparisons between different methodologies straightforward."
        expect(package.dependencies.to_sentence).to eq "R (>= 2.15.0), xtable, and pbapply"
        expect(package.authors.to_sentence).to eq "Scott Fortmann-Roe"
        expect(package.maintainers.to_sentence).to eq "Scott Fortmann-Roe <scottfr@berkeley.edu>"
      end
    end

    it "creates a package with several authors" do
      VCR.use_cassette("adegenet_packages") do
        package = Cran::PackageCreator.create!("Package" => "adegenet", "Version" => "1.4-2")

        expect(package.name).to eq "adegenet"
        expect(package.version).to eq "1.4-2"
        expect(package.publication_date.to_s).to eq "2014-05-13 07:44:32 UTC"
        expect(package.title).to eq "adegenet: an R package for the exploratory analysis of genetic and genomic data."
        expect(package.description).to eq "Classes and functions for genetic data analysis within the multivariate framework."
        expect(package.dependencies.to_sentence).to eq "R (>= 2.14), methods, and ade4"
        expect(package.authors.to_sentence).to eq "Thibaut Jombart, Caitlin Collins, Peter Solymos, Ismail Ahmed, Federico Calboli, and Anne Cori"
        expect(package.maintainers.to_sentence).to eq "Thibaut Jombart <t.jombart@imperial.ac.uk>"
      end
    end
  end
end

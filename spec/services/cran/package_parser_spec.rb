require 'rails_helper'

describe Cran::PackageParser do
  describe "#parse!" do
    it "downloads and read cran's packages file" do
      VCR.use_cassette("a3_packages") do
        subject = Cran::PackageParser.new("Package" => "A3", "Version" => "0.9.2")

        expect(subject.parse!).to eq({
          "Package" => "A3",
          "Version" => "0.9.2",
          "Author" => "Scott Fortmann-Roe",
          "Date" => "2013-03-24",
          "Date/Publication" => "2013-03-26 19:58:40",
          "Depends" => "R (>= 2.15.0), xtable, pbapply",
          "Description" => "This package supplies tools for tabulating and analyzing the results of predictive models. The methods employed are applicable to virtually any predictive model and make comparisons between different methodologies straightforward.",
          "License" => "GPL (>= 2)",
          "Maintainer" => "Scott Fortmann-Roe <scottfr@berkeley.edu>",
          "NeedsCompilation" => "no",
          "Packaged" => "2013-03-26 18:58:12 UTC; scott",
          "Repository" => "CRAN",
          "Suggests" => "randomForest, e1071",
          "Title" => "A3: Accurate, Adaptable, and Accessible Error Metrics for Predictive Models",
          "Type" => "Package"
        })
      end
    end
  end
end

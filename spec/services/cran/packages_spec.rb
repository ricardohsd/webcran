require 'rails_helper'

describe Cran::Packages do
  describe ".read" do
    it "downloads and read cran's packages file" do
      VCR.use_cassette("packages") do
        subject = Cran::Packages.read

        expect(subject.count).to eq 6250

        expect(subject.first).to eq({
          "Package" => "A3",
          "Version" => "0.9.2",
          "Depends" => "R (>= 2.15.0), xtable, pbapply",
          "License" => "GPL (>= 2)",
          "NeedsCompilation" => "no",
          "Suggests" => "randomForest, e1071"
        })
      end
    end
  end
end

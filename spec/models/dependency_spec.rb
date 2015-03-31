require 'rails_helper'

RSpec.describe Dependency, :type => :model do
  context "Validations" do
    it "validates presence of package_version" do
      subject.valid?

      expect(subject.errors[:package_version]).to eq ["can't be blank"]
    end

    it "validates presence of name" do
      subject.valid?

      expect(subject.errors[:name]).to eq ["can't be blank"]
    end
  end

  describe "#find_dependency!" do
    it "finds and set the dependent package" do
      subject.name = "boolean3"

      package = double
      expect(Package).to receive(:find_by).with(name: "boolean3").and_return(package)
      expect(subject).to receive(:update_attribute).with(:dependent_package, package)

      subject.find_dependency!
    end
  end

  describe "#to_s" do
    context "when version is blank" do
      it "returns the name" do
        subject.name = "boolean3"

        expect(subject.to_s).to eq "boolean3"
      end
    end

    context "when version is present" do
      it "returns the name" do
        subject.name = "boolean3"
        subject.version = "4.5.1"

        expect(subject.to_s).to eq "boolean3 (4.5.1)"
      end
    end
  end
end

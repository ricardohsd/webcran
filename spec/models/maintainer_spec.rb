require 'rails_helper'

describe Maintainer do
  context "Validations" do
    it "validates presence of name" do
      subject.valid?

      expect(subject.errors[:name]).to eq ["can't be blank"]
    end
  end

  describe "#to_s" do
    it "returns name and email when email is present" do
      subject.name = "Ricardo"
      subject.email = "ricardohsd@gmail.com"

      expect(subject.to_s).to eq "Ricardo <ricardohsd@gmail.com>"
    end

    it "returns name when email is blank" do
      subject.name = "Ricardo"
      subject.email = nil

      expect(subject.to_s).to eq "Ricardo"
    end
  end
end

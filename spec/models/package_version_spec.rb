require 'rails_helper'

describe PackageVersion do
  context "Validations" do
    it "validates presence of package" do
      subject.valid?

      expect(subject.errors[:package]).to eq ["can't be blank"]
    end

    it "validates presence of version" do
      subject.valid?

      expect(subject.errors[:version]).to eq ["can't be blank"]
    end

    it "validates presence of title" do
      subject.valid?

      expect(subject.errors[:title]).to eq ["can't be blank"]
    end

    it "validates presence of description" do
      subject.valid?

      expect(subject.errors[:description]).to eq ["can't be blank"]
    end
  end
end

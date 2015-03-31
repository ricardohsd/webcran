require 'rails_helper'

describe Package do
  fixtures :all

  context "Validations" do
    it "validates presence of name" do
      subject.valid?

      expect(subject.errors[:name]).to eq ["can't be blank"]
    end
  end

  describe "#add_version!" do
    it "creates a package version" do
      attributes = {}

      versions = double
      expect(subject).to receive(:versions).and_return(versions).twice

      expect(versions).to receive(:find_by).and_return(false)
      expect(versions).to receive(:create!).with(attributes)

      subject.add_version!(attributes)
    end

    it "creates a package version" do
      subject = Package.find_by(name: "Redis")

      attributes = { version: "2.4.1" }

      expect(subject.versions).to_not receive(:create!)

      subject.add_version!(attributes)
    end
  end
end

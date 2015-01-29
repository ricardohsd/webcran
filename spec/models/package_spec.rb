require 'rails_helper'

describe Package do
  context "Validations" do
    it "validates presence of name" do
      subject.valid?

      expect(subject.errors[:name]).to eq ["can't be blank"]
    end
  end
end

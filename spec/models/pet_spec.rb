require "rails_helper"

describe Pet do
  describe "associations" do
    it { should belong_to(:shelter) }
  end

  describe "validations" do
    it { should validate_presence_of(:image) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:sex) }
    it { should validate_numericality_of(:approximate_age).is_greater_than_or_equal_to(0) }
  end
end

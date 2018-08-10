require 'rails_helper'

RSpec.describe Rating, type: :model do
  describe "validations" do

    it "should not create a rating with out a rating " do
      rating = build(:rating,rate:'')
      p rating.rate
      expect(rating.valid?).to be_falsey
    end

    it "rating should be between 1 to 5 " do
      rating = build(:rating,rate: 100)
      expect(rating.valid?).to be_falsey
    end
  end
end

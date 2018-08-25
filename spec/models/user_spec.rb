require 'rails_helper'

RSpec.describe User, type: :model do
  describe "wrong-details" do
    it "email validation fail" do
      user=build(:user,email: 'kzsjdgfsg')
      expect(user.valid?).to be_falsey
    end
    it "password-fail" do
      user=build(:user,password: "dgsgassga")
      expect(user.valid?).to be_falsey
    end
  end
  describe "correct-details" do
    it "email validation passed" do
    user=build(:user)
    expect(user.valid?).to be_truthy
    end
  it "password validation passed" do
  user=build(:user)
  expect(user.valid?).to be_truthy
  end
  end
  end

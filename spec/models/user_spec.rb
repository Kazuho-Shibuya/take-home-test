require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#validations" do
    it "is valid with a name" do
      user = FactoryBot.build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a name" do
      user = FactoryBot.build(:user, name: nil)
      expect(user).to be_invalid
    end
  end
end

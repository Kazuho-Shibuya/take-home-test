require 'rails_helper'

RSpec.describe Income, type: :model do
  describe "#associations" do
    it { should belong_to(:user) }
    it { should belong_to(:income_expenditure_statement) }
  end

  describe "#validations" do
    it "is valid with a name and amount" do
      income = FactoryBot.build(:income)
      expect(income).to be_valid
    end

    it "is invalid without a name" do
      income = FactoryBot.build(:income, name: nil)
      expect(income).to be_invalid
    end

    it "is invalid without amount" do
      income = FactoryBot.build(:income, amount: nil)
      expect(income).to be_invalid
    end
  end
end

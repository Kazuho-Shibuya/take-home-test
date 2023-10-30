require 'rails_helper'

RSpec.describe Income, type: :model do
  describe "#associations" do
    it { should belong_to(:user) }
    it { should belong_to(:income_expenditure_statement) }
  end

  describe "#validations" do
    let(:income) { FactoryBot.build(:income) }

    it "is valid with a name and amount" do
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

    it 'requires positive integer' do
      income.amount = 42
      expect(income.valid?).to be true

      income.amount = 0
      expect(income.valid?).to be false

      income.amount = -1
      expect(income.valid?).to be false

      income.amount = 2147483647
      expect(income.valid?).to be true

      income.amount = 2147483648
      expect(income.valid?).to be false
    end
  end
end

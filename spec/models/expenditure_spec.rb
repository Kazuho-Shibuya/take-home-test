require 'rails_helper'

RSpec.describe Expenditure, type: :model do
  describe "#associations" do
    it { should belong_to(:user) }
    it { should belong_to(:income_expenditure_statement) }
  end

  describe "#validations" do
    it "is valid with a name and amount" do
      expenditure = FactoryBot.build(:expenditure)
      expect(expenditure).to be_valid
    end

    it "is invalid without a name" do
      expenditure = FactoryBot.build(:expenditure, name: nil)
      expect(expenditure).to be_invalid
    end

    it "is invalid without amount" do
      expenditure = FactoryBot.build(:expenditure, amount: nil)
      expect(expenditure).to be_invalid
    end

    it 'requires positive integer' do
      expenditure = FactoryBot.build(:expenditure)

      expenditure.amount = 42
      expect(expenditure.valid?).to be true

      expenditure.amount = 0
      expect(expenditure.valid?).to be false

      expenditure.amount = -1
      expect(expenditure.valid?).to be false

      expenditure.amount = 2147483647
      expect(expenditure.valid?).to be true

      expenditure.amount = 2147483648
      expect(expenditure.valid?).to be false
    end
  end
end

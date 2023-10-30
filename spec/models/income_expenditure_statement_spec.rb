require 'rails_helper'

RSpec.describe IncomeExpenditureStatement, type: :model do
  describe "#associations" do
    it { should belong_to(:user) }
    it { should have_many(:incomes).dependent(:destroy) }
    it { should have_many(:expenditures).dependent(:destroy) }
  end

  describe "#validations" do
    it "is valid with disposable_income and rating" do
      income_expenditure_statement = FactoryBot.build(:income_expenditure_statement)
      expect(income_expenditure_statement).to be_valid
    end

    it "is invalid without a disposable_income" do
      income_expenditure_statement = FactoryBot.build(:income_expenditure_statement, disposable_income: nil)
      expect(income_expenditure_statement).to be_invalid
    end

    it "is invalid without a rating" do
      income_expenditure_statement = FactoryBot.build(:income_expenditure_statement, rating: nil)
      expect(income_expenditure_statement).to be_invalid
    end
  end
end

class IncomeExpenditureStatement < ApplicationRecord
  belongs_to :user

  validates :disposable_income, presence: true
  validates :rating, presence: true
end

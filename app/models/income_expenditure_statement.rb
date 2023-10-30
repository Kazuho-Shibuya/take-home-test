class IncomeExpenditureStatement < ApplicationRecord
  belongs_to :user
  has_many :incomes, dependent: :destroy
  has_many :expenditures, dependent: :destroy

  validates :disposable_income, presence: true
  validates :rating, presence: true
end

class IncomeExpenditureStatement < ApplicationRecord
  belongs_to :user
  has_many :incomes, dependent: :destroy
  has_many :expenditures, dependent: :destroy

  accepts_nested_attributes_for :incomes, allow_destroy: true
  accepts_nested_attributes_for :expenditures, allow_destroy: true

  validates :disposable_income, presence: true
  validates :rating, presence: true
end

class Income < ApplicationRecord
  belongs_to :user
  belongs_to :income_expenditure_statement

  validates :name, presence: true
  validates :amount, presence: true
end

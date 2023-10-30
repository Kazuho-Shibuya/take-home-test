class Income < ApplicationRecord
  belongs_to :user
  belongs_to :income_expenditure_statement

  validates :name, presence: true
  validates :amount, presence: true, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 2147483647 }
end

class User < ApplicationRecord
  has_many :income_expenditure_statements, dependent: :destroy
  has_many :incomes, dependent: :destroy
  has_many :expenditures, dependent: :destroy

  validates :name, presence: true
end

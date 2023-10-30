class User < ApplicationRecord
  has_many :income_expenditure_statements, dependent: :destroy

  validates :name, presence: true
end

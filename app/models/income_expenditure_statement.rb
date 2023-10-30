class IncomeExpenditureStatement < ApplicationRecord
  belongs_to :user
  has_many :incomes, dependent: :destroy
  has_many :expenditures, dependent: :destroy

  accepts_nested_attributes_for :incomes, allow_destroy: true
  accepts_nested_attributes_for :expenditures, allow_destroy: true

  validates :disposable_income, presence: true
  validates :rating, presence: true

  class << self
    def merge_user_id(attributes, user_id)
      attributes.each do |attribute|
        attribute[1].merge!(user_id: user_id)
      end
      attributes
    end

    def calculate_total(attributes)
      amounts = []
      attributes.each do |attribute|
        amounts.push(attribute[1][:amount].to_i)
      end
      amounts.sum
    end

    def calculate_disposable_income(total_income, total_expenditure)
      total_income - total_expenditure
    end

    def determine_rating(total_income, total_expenditure)
      ratio = total_expenditure.to_f / total_income.to_f * 100
      case ratio
      when 0..10 then
        "A"
      when 10..30 then
        "B"
      when 30..50 then
        "C"
      else
        "D"
      end
    end
  end
end

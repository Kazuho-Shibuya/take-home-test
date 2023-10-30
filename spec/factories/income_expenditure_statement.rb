FactoryBot.define do
  factory :income_expenditure_statement do
    association :user
    disposable_income { 500 }
    rating { "A" }
  end
end

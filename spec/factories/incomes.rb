FactoryBot.define do
  factory :income do
    association :user
    association :income_expenditure_statement
    name { "Salary" }
    amount { 1000 }
  end
end

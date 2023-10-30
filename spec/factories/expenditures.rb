FactoryBot.define do
  factory :expenditure do
    association :user
    association :income_expenditure_statement
    name { "Travel" }
    amount { 1000 }
  end
end

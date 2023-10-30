require 'rails_helper'

RSpec.describe "income_expenditure_statements/show", type: :view do
  before(:each) do
    assign(:income_expenditure_statement, IncomeExpenditureStatement.create!(
      disposable_income: 2,
      rating: "A",
      user: FactoryBot.create(:user)
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Rating/)
    expect(rendered).to match(//)
  end
end

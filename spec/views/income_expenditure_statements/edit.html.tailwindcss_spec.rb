require 'rails_helper'

RSpec.describe "income_expenditure_statements/edit", type: :view do
  let(:income_expenditure_statement) {
    IncomeExpenditureStatement.create!(
      disposable_income: 1,
      rating: "D",
      user: FactoryBot.create(:user)
    )
  }

  before(:each) do
    assign(:income_expenditure_statement, income_expenditure_statement)
  end

  it "renders the edit income_expenditure_statement form" do
    render

    assert_select "form[action=?][method=?]", income_expenditure_statement_path(income_expenditure_statement), "post" do

      assert_select "input[name=?]", "income_expenditure_statement[disposable_income]"

      assert_select "input[name=?]", "income_expenditure_statement[rating]"

      assert_select "input[name=?]", "income_expenditure_statement[user_id]"
    end
  end
end

require 'rails_helper'

RSpec.describe "income_expenditure_statements/new", type: :view do
  before(:each) do
    assign(:income_expenditure_statement, IncomeExpenditureStatement.new(
      disposable_income: 1,
      rating: "B",
      user: FactoryBot.create(:user)
    ))
  end

  it "renders new income_expenditure_statement form" do
    render

    assert_select "form[action=?][method=?]", income_expenditure_statements_path, "post" do

      assert_select "input[name=?]", "income_expenditure_statement[disposable_income]"

      assert_select "input[name=?]", "income_expenditure_statement[rating]"

      assert_select "input[name=?]", "income_expenditure_statement[user_id]"
    end
  end
end

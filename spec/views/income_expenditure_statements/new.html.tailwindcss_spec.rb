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

      assert_select 'option', text: 'Kazuho Shibuya'
    end
  end
end

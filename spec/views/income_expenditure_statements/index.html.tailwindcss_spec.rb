require 'rails_helper'

RSpec.describe "income_expenditure_statements/index", type: :view do
  before(:each) do
    assign(:income_expenditure_statements, [
      IncomeExpenditureStatement.create!(
        disposable_income: 2,
        rating: "C",
        user: FactoryBot.create(:user)
      ),
      IncomeExpenditureStatement.create!(
        disposable_income: 2,
        rating: "C",
        user: FactoryBot.create(:user)
      )
    ])
  end

  it "renders a list of income_expenditure_statements" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("C".to_s), count: 2
  end
end

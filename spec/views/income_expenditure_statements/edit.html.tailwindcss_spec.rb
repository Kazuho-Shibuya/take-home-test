require 'rails_helper'

RSpec.describe "income_expenditure_statements/edit", type: :view do
  let(:income_expenditure_statement) {
    FactoryBot.create(:income_expenditure_statement)
  }

  before(:each) do
    assign(:income_expenditure_statement, income_expenditure_statement)
  end

  it "renders the edit income_expenditure_statement form" do
    render

    assert_select "form[action=?][method=?]", income_expenditure_statement_path(income_expenditure_statement), "post" do

      assert_select 'option', text: 'Kazuho Shibuya'
    end
  end
end

require 'rails_helper'

RSpec.describe "IncomeExpenditureStatements", type: :system do
  before do
    driven_by(:rack_test)
  end

  let!(:user) { FactoryBot.create(:user, name: "System") }
  let!(:income_expenditure_statement) { FactoryBot.create(:income_expenditure_statement, id: 1000) }

  it "POST /income_expenditure_statements" do
    visit "/income_expenditure_statements/new"
    select "System", from: "User"
    fill_in "Income name", with: "Salary"
    fill_in "Income amount", with: 10000
    fill_in "Expenditure name", with: "Travel"
    fill_in "Expenditure amount", with: 1000
    click_button "Create Income expenditure statement"

    expect(page).to have_text("Income expenditure statement was successfully created.")
    expect(page).to have_text("Month: #{Time.zone.today.strftime("%Y%m")}")
    expect(page).to have_text("Disposable income: £9,000")
    expect(page).to have_text("Rating: A")
  end
end

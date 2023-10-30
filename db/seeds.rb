users = [
  {
    name: "Kazu"
  },
  {
    name: "Taro"
  },
  {
    name: "Yamashita"
  }
]

User.create!(users)

income_expenditure_statements = [
  {
    user_id: 1,
    disposable_income: 1000,
    rating: "A"
  },
  {
    user_id: 2,
    disposable_income: 10000,
    rating: "B"
  },
  {
    user_id: 3,
    disposable_income: 5000,
    rating: "C"
  }
]

IncomeExpenditureStatement.create!(income_expenditure_statements)

incomes = [
  {
    user_id: 1,
    income_expenditure_statement_id: 1,
    name: "Salary",
    amount: 2800
  },
  {
    user_id: 1,
    income_expenditure_statement_id: 1,
    name: "Other",
    amount: 300
  }
]

Income.create!(incomes)

expenditures = [
  {
    user_id: 1,
    income_expenditure_statement_id: 1,
    name: "Mortgage",
    amount: 500
  },
  {
    user_id: 1,
    income_expenditure_statement_id: 1,
    name: "Utilities",
    amount: 100
  },
  {
    user_id: 1,
    income_expenditure_statement_id: 1,
    name: "Travel",
    amount: 150
  },
  {
    user_id: 1,
    income_expenditure_statement_id: 1,
    name: "Food",
    amount: 500
  },
  {
    user_id: 1,
    income_expenditure_statement_id: 1,
    name: "Loan Repayment",
    amount: 1000
  }
]

Expenditure.create!(expenditures)
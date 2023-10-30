class CreateIncomeExpenditureStatements < ActiveRecord::Migration[7.0]
  def change
    create_table :income_expenditure_statements do |t|
      t.integer :disposable_income, null: false
      t.string :rating, null: false, limit: 1
      t.references :user, foreign_key: true, null: false

      t.timestamps precision: 6
    end
  end
end

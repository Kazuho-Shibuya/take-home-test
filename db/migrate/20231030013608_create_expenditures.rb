class CreateExpenditures < ActiveRecord::Migration[7.0]
  def change
    create_table :expenditures do |t|
      t.references :user, foreign_key: true, null: false
      t.references :income_expenditure_statement, foreign_key: true, null: false
      t.string :name, null: false, limit: 50
      t.integer :amount, null: false

      t.timestamps precision: 6
    end
  end
end

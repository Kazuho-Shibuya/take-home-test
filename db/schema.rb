# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_10_30_013608) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "expenditures", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "income_expenditure_statement_id", null: false
    t.string "name", limit: 50, null: false
    t.integer "amount", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["income_expenditure_statement_id"], name: "index_expenditures_on_income_expenditure_statement_id"
    t.index ["user_id"], name: "index_expenditures_on_user_id"
  end

  create_table "income_expenditure_statements", force: :cascade do |t|
    t.integer "disposable_income", null: false
    t.string "rating", limit: 1, null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_income_expenditure_statements_on_user_id"
  end

  create_table "incomes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "income_expenditure_statement_id", null: false
    t.string "name", limit: 50, null: false
    t.integer "amount", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["income_expenditure_statement_id"], name: "index_incomes_on_income_expenditure_statement_id"
    t.index ["user_id"], name: "index_incomes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "expenditures", "income_expenditure_statements"
  add_foreign_key "expenditures", "users"
  add_foreign_key "income_expenditure_statements", "users"
  add_foreign_key "incomes", "income_expenditure_statements"
  add_foreign_key "incomes", "users"
end

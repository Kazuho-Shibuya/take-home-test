class IncomeExpenditureStatementsController < ApplicationController
  before_action :set_income_expenditure_statement, only: %i[ show edit update destroy ]

  # GET /income_expenditure_statements or /income_expenditure_statements.json
  def index
    @income_expenditure_statements = IncomeExpenditureStatement.all
  end

  # GET /income_expenditure_statements/1 or /income_expenditure_statements/1.json
  def show
  end

  # GET /income_expenditure_statements/new
  def new
    @income_expenditure_statement = IncomeExpenditureStatement.new
    @income_expenditure_statement.incomes.build
    @income_expenditure_statement.expenditures.build
  end

  # GET /income_expenditure_statements/1/edit
  def edit
  end

  # POST /income_expenditure_statements or /income_expenditure_statements.json
  def create
    @income_expenditure_statement = IncomeExpenditureStatement.new(income_expenditure_statement_params)

    respond_to do |format|
      if @income_expenditure_statement.save
        format.html { redirect_to income_expenditure_statement_url(@income_expenditure_statement), notice: "Income expenditure statement was successfully created." }
        format.json { render :show, status: :created, location: @income_expenditure_statement }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @income_expenditure_statement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /income_expenditure_statements/1 or /income_expenditure_statements/1.json
  def update
    respond_to do |format|
      if @income_expenditure_statement.update(income_expenditure_statement_params)
        format.html { redirect_to income_expenditure_statement_url(@income_expenditure_statement), notice: "Income expenditure statement was successfully updated." }
        format.json { render :show, status: :ok, location: @income_expenditure_statement }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @income_expenditure_statement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /income_expenditure_statements/1 or /income_expenditure_statements/1.json
  def destroy
    @income_expenditure_statement.destroy

    respond_to do |format|
      format.html { redirect_to income_expenditure_statements_url, notice: "Income expenditure statement was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_income_expenditure_statement
      @income_expenditure_statement = IncomeExpenditureStatement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def income_expenditure_statement_params
      permited = params.require(:income_expenditure_statement).permit(
        :user_id,
        :disposable_income,
        :rating,
        incomes_attributes:[ :id, :user_id, :name, :amount, :_destroy ],
        expenditures_attributes:[ :id, :user_id, :name, :amount, :_destroy ]
      )

      # Add user_id for incomes and expenditures
      permited[:incomes_attributes] = merge_user_id(permited[:incomes_attributes], permited[:user_id])
      permited[:expenditures_attributes] = merge_user_id(permited[:expenditures_attributes], permited[:user_id])

      total_income = calculate_total(permited[:incomes_attributes])
      total_expenditure = calculate_total(permited[:expenditures_attributes])

      permited[:disposable_income] = total_income - total_expenditure
      permited[:rating] = determine_rating(total_income, total_expenditure)

      permited
    end

    def merge_user_id(attributes, user_id)
      attributes.each do |attribute|
        attribute[1].merge!(user_id: user_id)
      end
      attributes
    end

    def calculate_total(attributes)
      amounts = []
      attributes.each do |attribute|
        amounts.push(attribute[1][:amount].to_i)
      end
      amounts.sum
    end

    def determine_rating(total_income, total_expenditure)
      ratio = total_expenditure.to_f / total_income.to_f * 100
      case ratio
      when 0..10 then
        "A"
      when 10..30 then
        "B"
      when 30..50 then
        "C"
      else
        "D"
      end
    end
end

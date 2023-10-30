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
      params.require(:income_expenditure_statement).permit(:disposable_income, :rating, :user_id)
    end
end

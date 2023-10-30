require "rails_helper"

RSpec.describe IncomeExpenditureStatementsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/income_expenditure_statements").to route_to("income_expenditure_statements#index")
    end

    it "routes to #new" do
      expect(get: "/income_expenditure_statements/new").to route_to("income_expenditure_statements#new")
    end

    it "routes to #show" do
      expect(get: "/income_expenditure_statements/1").to route_to("income_expenditure_statements#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/income_expenditure_statements/1/edit").to route_to("income_expenditure_statements#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/income_expenditure_statements").to route_to("income_expenditure_statements#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/income_expenditure_statements/1").to route_to("income_expenditure_statements#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/income_expenditure_statements/1").to route_to("income_expenditure_statements#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/income_expenditure_statements/1").to route_to("income_expenditure_statements#destroy", id: "1")
    end
  end
end

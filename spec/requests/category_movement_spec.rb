require 'rails_helper'

RSpec.describe "CategoryMovements", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/category_movement/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/category_movement/show"
      expect(response).to have_http_status(:success)
    end
  end

end

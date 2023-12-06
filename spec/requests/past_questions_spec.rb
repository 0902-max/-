require 'rails_helper'

RSpec.describe "PastQuestions", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/past_questions/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/past_questions/show"
      expect(response).to have_http_status(:success)
    end
  end

end

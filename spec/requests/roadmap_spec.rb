require 'rails_helper'

RSpec.describe "Roadmaps", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/roadmap/show"
      expect(response).to have_http_status(:success)
    end
  end

end

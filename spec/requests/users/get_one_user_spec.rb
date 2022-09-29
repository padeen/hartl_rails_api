require "rails_helper"

RSpec.describe "users", type: :request do
  describe "GET /show/" do
    it "return status code success" do
      FactoryBot.create(:user)

      get "/users/1"

      expect(response).to have_http_status(:success)
    end
  end
end
require "rails_helper"

RSpec.describe "users", type: :request do
  describe "GET /create" do
    context "with valid parameters" do
      it "return status code created" do
        post "/users", params: {
            user: {
              name: "Harke",
              email: "harke@harkema.net",
              password: "password123",
              password_confirmation: "password123"
            }
          }

        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid parameters" do
      it "return status code unprocessable entity" do
        post "/users", params: {
            user: {
              name: "",
              email: "",
              password: "",
              password_confirmation: ""
            }
          }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
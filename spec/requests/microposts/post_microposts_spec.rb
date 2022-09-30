require "rails_helper"

RSpec.describe "Microposts", type: :request do
  describe "POST /create" do
    before do
      FactoryBot.create(:user)
    end

    context "with valid parameters" do
      it "returns status code created" do
        post "/microposts", params: {
          micropost: {
            content: "Micropost content",
            user: 1
          }
        }

        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid parameters" do
      it "returns status code unprocessable entity" do
        post "/microposts", params: {
          micropost: {
            content: "",
            user: 1
          }
        }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end

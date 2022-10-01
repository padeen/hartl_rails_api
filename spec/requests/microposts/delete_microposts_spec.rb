require "rails_helper"

RSpec.describe "Microposts", type: :request do
  describe "DELETE /destroy" do
    it "returns status code no content" do
      usr = FactoryBot.create(:user)
      FactoryBot.create(:micropost, content: "Micropost content text", user: usr)

      delete "/microposts/1"

      expect(response).to have_http_status(204)
    end
  end
end
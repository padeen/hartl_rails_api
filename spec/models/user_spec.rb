require 'rails_helper'

RSpec.describe User, type: :model do
  context "with valid attributes" do
    it "should be valid" do
      usr = User.new(name: "Harke", email: "harke@harkema.net", 
        password: "password123", password_confirmation: "password123")
      expect(usr.valid?).to equal(true)
    end
  end

  context "with invalid attributes" do
    it "should be invalid" do
      usr = User.new(name: "", email: "", password: "",
        password_confirmation: "")
      expect(usr.valid?).to equal(false)
    end
  end

  context "when creating a new user with non unique email address" do
    it "should be invalid" do
      usr = User.new(name: "Harke", email: "harke@harkema.net",
        password: "password123", password_confirmation: "password123")
      usr.save
      usr2 = User.new(name: "Tjeerd", email: "harke@harkema.net",
        password: "password123", password_confirmation: "password123")
      expect(usr2.valid?).to equal(false)
    end
  end
end

require 'rails_helper'

describe "a visitor visits /signup" do
  describe "they enter valid credentials" do
    it "they successfully create a new account" do
      visit signup_path
      fill_in "user[email]", with: "joey@example.com"
      fill_in "user[password]", with: "password"
      fill_in "user[password_confirmation]", with: "password"
      click_on "Submit"

      expect(User.count).to eq(1)
      expect(User.first.email).to eq("joey@example.com")
    end
  end
end

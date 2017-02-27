require 'rails_helper'

describe "a visitor visits /signup" do
  describe "they enter valid credentials" do
    it "they successfully create a new account" do
      visit signup_path
      fill_in "user[email]", with: "joey@example.com"
      fill_in "user[password]", with: "password"
      fill_in "user[password_confirmation]", with: "password"
      click_on "Submit"

      expect(page).to have_current_path(root_path)
      expect(User.count).to eq(1)
      expect(User.first.email).to eq("joey@example.com")
    end
  end

  describe "they enter taken email" do
    it "they fail to create an account and see flash message" do
      user = create(:user)

      visit signup_path
      fill_in "user[email]", with: user.email
      fill_in "user[password]", with: "password"
      fill_in "user[password_confirmation]", with: "password"
      click_on "Submit"

      expect(page).to have_current_path(signup_path)
      expect(page).to have_content("email has already been taken")
      expect(User.count).to eq(1)
    end
  end

  describe "they enter mismatched passwords" do
    it "they fail to create an account and see flash message" do

      visit signup_path
      fill_in "user[email]", with: "joey@example.com"
      fill_in "user[password]", with: "password"
      fill_in "user[password_confirmation]", with: "assword"
      click_on "Submit"

      expect(page).to have_current_path(signup_path)
      expect(page).to have_content("passwords don't match")
      expect(User.count).to eq(0)
    end
  end
end

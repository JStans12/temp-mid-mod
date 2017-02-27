require 'rails_helper'

describe "a logged out user visits /login" do
  describe "they enter valid credentials" do
    it "they are logged in and see flash message" do
      user = create(:user)

      visit login_path
      fill_in "email", with: user.email
      fill_in "password", with: "password"
      click_on "Submit"

      expect(page).to have_current_path(root_path)
      expect(page).to have_content("signed in as #{user.email}")
    end
  end

  describe "they enter bad password" do
    it "they are not logged in and see flash message" do
      user = create(:user)

      visit login_path
      fill_in "email", with: user.email
      fill_in "password", with: "assword"
      click_on "Submit"

      expect(page).to have_current_path(login_path)
      expect(page).to have_content("failed to log in")
    end
  end

  describe "they enter bad email" do
    it "they are not logged in and see flash message" do
      user = create(:user)

      visit login_path
      fill_in "email", with: "stuff"
      fill_in "password", with: "password"
      click_on "Submit"

      expect(page).to have_current_path(login_path)
      expect(page).to have_content("failed to log in")
    end
  end
end

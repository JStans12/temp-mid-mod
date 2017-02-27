require 'rails_helper'

describe "a logged out user visits /login" do
  describe "they enter valid credentials" do
    it "they are logged in" do
      user = create(:user)

      visit login_path
      fill_in "email", with: user.email
      fill_in "password", with: "password"
      click_on "Submit"

      expect(page).to have_current_path(root_path)
      expect(page).to have_content("signed in as #{user.email}")
    end
  end
end

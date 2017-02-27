require 'rails_helper'

describe "a logged in user visits root" do
  describe "they click on Sign Out" do
    it "their session is cleared and they are directed to the root" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "/"
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(nil)
      click_on "Sign Out"

      expect(page).to have_current_path(login_path)
    end
  end
end

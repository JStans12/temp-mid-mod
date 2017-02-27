require 'rails_helper'

RSpec.describe "can mark links read and unread", :js => :true do
  describe "User marks a link as read" do
    it "is updated on page without refresh and in database" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "/"
      fill_in "Title:", :with => "Turing"
      fill_in "URL:", :with => "http://turing.io"
      click_on "Add Link"

      sleep(1)
      within("#link-#{Link.first.id}") do
        click_on "Mark as Read"
        expect(page).to have_content("true")
        expect(page).to have_button("Mark as Unread")
      end

      expect(Link.first.read).to eq(true)
    end
  end

  describe "User marks a link as unread" do
    it "is updated on page without refresh and in database" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "/"
      fill_in "Title:", :with => "Turing"
      fill_in "URL:", :with => "http://turing.io"
      click_on "Add Link"

      sleep(1)
      within("#link-#{Link.first.id}") do
        click_on "Mark as Read"
      end

      within("#link-#{Link.first.id}") do
        click_on "Mark as Unread"
        expect(page).to have_content("false")
        expect(page).to have_button("Mark as Read")
      end

      expect(Link.first.read).to eq(false)
    end
  end
end

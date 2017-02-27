require "rails_helper"

RSpec.describe "can edit links", :js => :true do
  describe "user navigates to /links/:id/edit" do
    it "they are able to edit the link with good credentials" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "/"
      fill_in "Title:", :with => "Turing"
      fill_in "URL:", :with => "http://turing.io"
      click_on "Add Link"
      sleep(1)

      visit "/links/#{Link.first.id}/edit"

      fill_in "link_title", with: "tooring"
      click_on "Update Link"

      expect(page).to have_current_path(root_path)
    end

    it "they can't edit with no title" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "/"
      fill_in "Title:", :with => "Turing"
      fill_in "URL:", :with => "http://turing.io"
      click_on "Add Link"
      sleep(1)

      visit "/links/#{Link.first.id}/edit"

      fill_in "link_title", with: ""
      click_on "Update Link"

      expect(page).to have_current_path(edit_link_path(Link.first))
      expect(page).to have_content("Title can't be blank")
    end

    it "they can't edit with no url" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "/"
      fill_in "Title:", :with => "Turing"
      fill_in "URL:", :with => "http://turing.io"
      click_on "Add Link"
      sleep(1)

      visit "/links/#{Link.first.id}/edit"

      fill_in "link_url", with: ""
      click_on "Update Link"

      expect(page).to have_current_path(edit_link_path(Link.first))
      expect(page).to have_content("Url can't be blank")
    end

    it "they can't edit with invalid url" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "/"
      fill_in "Title:", :with => "Turing"
      fill_in "URL:", :with => "http://turing.io"
      click_on "Add Link"
      sleep(1)

      visit "/links/#{Link.first.id}/edit"

      fill_in "link_url", with: ""
      click_on "Update Link"

      expect(page).to have_current_path(edit_link_path(Link.first))
      expect(page).to have_content("Url is invalid")
    end
  end
end

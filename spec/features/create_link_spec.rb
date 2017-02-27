require "rails_helper"

RSpec.describe "can create links", :js => :true do
  scenario "Create a new link" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/"
    fill_in "Title:", :with => "Turing"
    fill_in "URL:", :with => "http://turing.io"
    click_on "Add Link"

    within('#links-list') do
      expect(page).to have_text("Turing")
      expect(page).to have_text("http://turing.io")
    end

    expect(Link.count).to eq(1)
  end

  describe "user doesn't enter link info" do
    it "user sees 3 errors on page" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "/"
      click_on "Add Link"

      expect(Link.count).to eq(0)
      expect(page).to have_content("Title can't be blank. Url can't be blank. Url is invalid")
    end
  end

  describe "user enters invalid url" do
    it "user sees invalid url error" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "/"
      fill_in "Title:", :with => "Turing"
      fill_in "URL:", :with => "turing"
      click_on "Add Link"

      expect(Link.count).to eq(0)
      expect(page).to have_content("Url is invalid")
    end
  end

  describe "user doesn't enter title" do
    it "user sees invalid url error" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "/"
      fill_in "URL:", :with => "http://turing.io"
      click_on "Add Link"

      expect(Link.count).to eq(0)
      expect(page).to have_content("Title can't be blank")
    end
  end

  describe "user doesn't enter url" do
    it "user sees invalid url error" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "/"
      fill_in "Title:", :with => "Turing"
      click_on "Add Link"

      expect(Link.count).to eq(0)
      expect(page).to have_content("Url can't be blank")
    end
  end
end

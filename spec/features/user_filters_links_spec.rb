require 'rails_helper'

describe "a logged in user visits root", :js => :true do
  describe "they type some stuff in the search box" do
    it "filters based on title" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      link1 = user.links.create(url: "http://turing.io", title: "turing")
      link1 = user.links.create(url: "http://tuuring.io", title: "tooring")

      visit '/'

      find("#filter").set("too")

      expect(page).to have_content("tooring")
      expect(page).to_not have_content("turing")
    end

    it "filters based on url" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      link1 = user.links.create(url: "http://turing.io", title: "turing")
      link1 = user.links.create(url: "http://tooring.io", title: "tuuring")

      visit '/'

      find("#filter").set("too")

      expect(page).to have_content("tuuring")
      expect(page).to_not have_content("turing")
    end
  end

  describe "they click 'read only'" do
    it "filters out all the unread links" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      link1 = user.links.create(url: "http://turing.io", title: "turing")
      link1 = user.links.create(url: "http://tooring.io", title: "tooring", read: true)

      visit '/'

      click_on "Read Only"

      expect(page).to have_content("tooring")
      expect(page).to_not have_content("turing")
    end
  end

  describe "they click 'read only'" do
    it "filters out all the unread links" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      link1 = user.links.create(url: "http://turing.io", title: "turing")
      link1 = user.links.create(url: "http://tooring.io", title: "tooring", read: true)

      visit '/'

      click_on "Unread Only"

      expect(page).to have_content("turing")
      expect(page).to_not have_content("tooring")
    end
  end
end

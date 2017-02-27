require 'rails_helper'

RSpec.describe Link, type: :model do
  describe "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :url }

    it "should validate url validity" do
      Link.create(title: "good", url: "http://www.things.com")
      bad = Link.create(title: "bad", url: "waffles")

      expect(Link.count).to eq(1)
      expect(bad.errors.messages.first[1][0]).to eq("is invalid")
    end
  end
end

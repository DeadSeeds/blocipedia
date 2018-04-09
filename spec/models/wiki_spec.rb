require 'rails_helper'

RSpec.describe Wiki, type: :model do
  let(:my_wiki) { Wiki.create!(title: "New Title!", body: "A bunch of stuff.", private: false) }

  describe "attributes" do
    it "has a title and body" do
      expect(my_wiki).to have_attributes(title: "New Title!", body: "A bunch of stuff.")
    end
  end
end

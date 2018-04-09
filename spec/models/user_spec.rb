require 'rails_helper'

RSpec.describe User, type: :model do
let(:user) { User.create!(email: "user@test.com", password: "password") }

  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:password) }

  describe "attributes" do
    it "responds to role" do
      expect(user).to respond_to(:role)
    end

    it "responds to admin?" do
      expect(user).to respond_to(:admin?)
    end

    it "responds to standard?" do
      expect(user).to respond_to(:standard?)
    end

    it "responds to premium?" do
      expect(user).to respond_to(:premium?)
    end
  end

  describe "roles" do
    it "is standard by default" do
      expect(user.role).to eq("standard")
    end

    it "returns falsey for admin?" do
      expect(user.admin?).to be_falsey
    end
  end


end

require 'rails_helper'

RSpec.describe Users::DowngradeController, type: :controller do
  let(:user) { User.create!(email: "user1@user.com", password: "password", role: "premium") }
  let(:user2) { User.create!(email: "user2@user.com", password: "password", role: "standard") }

  context "premium user" do

    login_user

    describe "downgrade user role" do
      it "downgrades a user from premium to standard" do
        post :create, {user_id: user.id}
        expect(assigns(:role)).to eq("standard")
      end
    end
  end


  context "standard user" do

    login_user

    describe "downgrade user role" do
      it "does not downgrade a standard user" do
        post :create, {user_id: user2.id}
          expect(assigns(:role)).to eq("standard")
      end
    end
  end

end

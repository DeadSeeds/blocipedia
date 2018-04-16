class Users::UpgradeController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "Stripe User ",
      amount: @amount
    }
  end
end

class Users::UpgradeController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "Blocipedia User - #{current_user.email} ",
      amount: 1500
    }
    @role = @user.role
  end
end

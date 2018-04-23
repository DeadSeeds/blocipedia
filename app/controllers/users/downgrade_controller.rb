class Users::DowngradeController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @role = @user.role
  end

  def downgrade
    @user = User.find(params[:user_id])
    @user.role = "standard"
    @user.save
    binding.pry

    if @user.save
      flash[:notice] = "Your account has been downgraded."
      redirect_to wikis_path
    else
      flash.now[:alert] = "There was an error downgrading your account.  Please try again."
    end

  end


end

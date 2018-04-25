class Users::DowngradeController < ApplicationController
  def index
    @user = current_user
    @role = @user.role
    @user.wikis = Wiki.where(user_id: @user.id)
  end

  def create
    @user = current_user
    @user.role = "standard"
    @role = @user.role
    @user.wikis = Wiki.where(user_id: @user.id)
    @user.wikis.update_all(private: false)


    if @user.save
      flash[:notice] = "Your account has been downgraded.  We're sorry to see you go."
      redirect_to wikis_path
    else
      flash.now[:alert] = "There was an error downgrading your account.  Please try again."
    end
  end

  def new
    @user = current_user

    respond_to do |format|
      format.html
      format.js
    end
  end

end

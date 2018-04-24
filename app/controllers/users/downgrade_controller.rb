class Users::DowngradeController < ApplicationController
  def index
<<<<<<< HEAD
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
=======
    @user = current_user
    @role = @user.role
  end

  def create
    @user = current_user
    @user.role = "standard"
    @role = @user.role

    if @user.save
      flash[:notice] = "Your account has been downgraded.  We're sorry to see you go."
>>>>>>> Downgrade not working
      redirect_to wikis_path
    else
      flash.now[:alert] = "There was an error downgrading your account.  Please try again."
    end
<<<<<<< HEAD

  end


=======
  end
>>>>>>> Downgrade not working
end

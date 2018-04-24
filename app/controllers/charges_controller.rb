class ChargesController < ApplicationController
  def create
    # Amount in cents
    # @amount = params([:amount])
    @user = current_user

    customer = Stripe::Customer.create(
      :email => current_user.email,
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer       => customer.id,
      :amount         => 1500,
      :description    => "Stripe customer - #{current_user.email} ",
<<<<<<< HEAD
      :receipt_email  => current_user.email,
=======
      :receipt_email  => @user.email,
>>>>>>> Downgrade not working
      :currency       => 'usd'
    )

    flash[:notice] = "Thank you for your payment!  Your account has been upgraded."
    @user.role = "premium"
    @user.save
    redirect_to wikis_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end

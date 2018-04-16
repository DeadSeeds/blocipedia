class ChargesController < ApplicationController
  def create
    # Amount in cents
    @amount = params([:amount])

    customer = Stripe::Customer.create(
      :email => current_user.email,
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => 1500,
      :description => "Stripe customer - #{current_user.email} ",
      :currency    => 'usd'
    )

    flash[:notice] = "Thank you for your payment!"
    redirect_to wikis_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end

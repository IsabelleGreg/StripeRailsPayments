class ChargesController < ApplicationController
	def create
	  # Amount in cents
	  @amount = params[:amount]

	  @amount = @amount.gsub('$', '').gsub(',', '')

	  begin
	    @amount = Float(@amount).round(2)
	  rescue
	    flash[:error] = 'Charge not completed. Please enter a valid amount in USD ($).'
	    redirect_to new_charge_path
	    return
	  end

	  @amount = (@amount * 100).to_i # Must be an integer!

	  if @amount < 500
	    flash[:error] = 'Charge not completed. Donation amount must be at least $5.'
	    redirect_to new_charge_path
	    return
	  end

	  customer = Stripe::Customer.create(
	    :email => params[:stripeEmail],
	    :source  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount => @amount,
	    :currency    => 'cad',
	    :description => 'custom donation',
	    :source => params[:stripeToken]
	    
	  )

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to new_charge_path
	end
end
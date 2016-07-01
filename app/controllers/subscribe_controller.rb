class SubscribeController < ApplicationController
	before_filter :authenticate_user!

	def new
		
	end

	def update
		# Get the credit card details submitted by the form
		token = params[:stripeToken]

		# Create a customer
		customer = Stripe::Customer.create(
			:card => token,
			:plan => 133,
			:email => current_user.email
			)

		current_user.subscribed = true
		current_user.stripeid = customer.id
		current_user.save

		redirect_to root_path, :notice => "Your Subscription was setup! You may access Pin-Board now!"
	end
end

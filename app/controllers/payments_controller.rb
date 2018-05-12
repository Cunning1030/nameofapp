class PaymentsController < ApplicationController

  before_action :authenticate_user!

  # POST /payments
  # POST /payments.json

  def create

    @product = Product.find(params[:product_id])

    token = params[:stripeToken]
    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        amount: "$ <%= @product.price %>", # amount in cents, again
        currency: "usd",
        source: token,
        receipt_email: "<%= @user.email %>",
        description: params[:stripeEmail]
      )

      if charge.paid
        Order.create(:product_id, :user_id, :total)
      end
    end

    rescue Stripe::CardError => e
      # The card has been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    end
  end

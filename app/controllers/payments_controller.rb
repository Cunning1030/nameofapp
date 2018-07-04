class PaymentsController < ApplicationController

  before_action :authenticate_user!

  # POST /payments
  # POST /payments.json

  def create

    @product = Product.find(params[:product_id])
    @user = current_user
    $amount = (@product.price * 100).to_i

    token = params[:stripeToken]
    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        amount: $amount, # amount in cents, again
        currency: "usd",
        source: token,
        receipt_email: @user.email,
        description: params[:stripeEmail]
      )

      if charge.paid
        order = Order.create(order_params)
        UserMailer.order_placed(current_user, order).deliver_now
      end

    end

    rescue Stripe::CardError => e
      # The card has been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.permit(:product_id, :user_id, :total)
    end

class SimplePagesController < ApplicationController

  def index
    @featured_product = Product.first  # now unused
    @products = Product.limit(3)
  end

  def about
  end

  def contact
  end

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    UserMailer.contact_form(@email, @name, @message).deliver_now
  end

end

class SimplePagesController < ApplicationController

  def index
  end

  def about
  end

  def contact
  end

  def landing_page
    @featured_product = Product.first  # now unused
    @products = Product.limit(3)
  end

end

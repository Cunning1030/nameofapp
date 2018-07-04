class OrdersController < ApplicationController

  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @orders = Order.accessible_by(current_ability)
  end

  def show
  end

  def new
  end

  def create
  end

  def destroy
  end

end

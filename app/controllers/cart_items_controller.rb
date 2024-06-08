class CartItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @cart_items = CartItem.where(user_id: current_user.id)
  end
end

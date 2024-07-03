class OrdersController < ApplicationController
  before_action :authenticate_user!

  def new
    @order = Order.new
    @addresses = Address.all
  end

  def create
    order_params = params.require(:order).permit(:shipping_address, :shipping_phone, :estimated_delivery_date)
    @order = Order.new(order_params)
    @order.user = current_user
    @order.save!
    redirect_to @order, notice: "Pedido registrado com sucesso!"
    # @order vai encaminhar para o show do objeto
  end

  def show
    @order = Order.find(params[:id])
  end
end

class AddressesController < ApplicationController
  before_action :authenticate_user!

  def new
    @address = Address.new
  end

  def create
    address_params = params.require(:address).permit(:street, :number, :neighborhood, :city, :state, :postal_code, :country, :complement)
    @address = Address.new(address_params)
    @address.user = current_user
    if @address.save()
      redirect_to user_path(current_user), notice: "Endereço cadastrado com sucesso!"
    else
      flash.now[:notice] = "Endereço não cadastrado!"
      render "new"
    end
  end
end

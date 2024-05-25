class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
  end

  def create
    product_params = params.require(:product).permit(:name, :price, :description, :stock, :image)
    p = Product.new(product_params)
    p.save!()
    redirect_to root_path, notice: "Produto cadastrado com sucesso!"
  end
end

class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    product_params = params.require(:product).permit(:name, :price, :description, :stock, :image)
    @product = Product.new(product_params)
    if @product.save()
      redirect_to root_path, notice: "Produto cadastrado com sucesso!"
    else
      flash.now[:notice] = "Produto não cadastrado!"
      render "new"
    end
  end

  def edit
    id = params[:id]
    @product = Product.find(id)
  end

  def update
    id = params[:id]
    @product = Product.find(id)
    product_params = params.require(:product).permit(:name, :price, :description, :stock, :image)

    if @product.update(product_params)
      redirect_to product_path(@product.id), notice: "Produto alterado com sucesso!"
    else
      flash[:notice] = "Não foi possível atualizar o produto"
      render "edit"
    end
  end
end

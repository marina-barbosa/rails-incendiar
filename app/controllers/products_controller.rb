class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_admin, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show; end

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

  def edit; end

  def update
    product_params = params.require(:product).permit(:name, :price, :description, :stock, :image)

    if @product.update(product_params)
      redirect_to product_path(@product.id), notice: "Produto alterado com sucesso!"
    else
      flash[:notice] = "Não foi possível atualizar o produto"
      render "edit"
    end
  end

  def destroy
    if @product.destroy
      redirect_to root_path, notice: "Produto removido com sucesso!"
    else
      redirect_to product_path(@product.id), notice: "Produto não pode ser removido!"
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end
end

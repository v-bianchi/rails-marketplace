class ProductsController < ApplicationController
  before_action :find_product, only: [ :show, :edit, :update, :destroy ]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new
    if @product.save
      redirect_to @product
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update
      redirect_to @product
    else
      render :update
    end
  end

  def destroy
    @product.destroy
  end

  private

  def product_params
    params.require(:product).permit(:title, :category, :picture, :description)
  end

  def find_product
    @product.find(product_params)
  end

end

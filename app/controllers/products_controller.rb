class ProductsController < ApplicationController
  def index
    @products = Product.includes(:category).where(published: true)
  end

  def show
    @product = Product.find(params.require(:id))
  end

  def new
    @product = Product.new
  end

  def create
    product_params = params.require(:product).permit(:title, :description, :price, :published, :category_id, :difficulty_level)
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_url
    else
      render :new
    end
  end
end

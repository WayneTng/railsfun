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
end

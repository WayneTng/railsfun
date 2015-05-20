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

  def edit
    @product = Product.find(params[:id])
    render :new
  end

  def destroy
    @product = Product.find(params.require(:id))
    if @product.destroy
      flash[:notice] = 'You have successfully delete your product'
    else
      flash[:notice] = 'there is an error in deletion'
    end
      redirect_to products_url
  end

  def update
    @product  = Product.find(params.require(:id))
    product_params = params.require(:product).permit(:title, :description, :price, :published, :category_id, :difficulty_level)
    if @product.update(product_params)
      flash[:notice] = 'You have successfully updated your product!'
      redirect_to edit_product_url(@product)
    else
      flash.now[:notice] = 'There is an error with your input'
      render :new
    end

  end
  def create
    product_params = params.require(:product).permit(:title, :description, :price, :published, :category_id, :difficulty_level)
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = 'You have successfully created your product!'
      redirect_to products_url
    else
      flash.now[:notice] = 'There is an error with your input'
      render :new
    end
  end
end

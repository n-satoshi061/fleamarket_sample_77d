class ProductsController < ApplicationController

  def index
    @product = Product.all
  end

  def new
    @product = Product.new
    @product.images.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
    redirect_to root_path
    else
    render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def buy
  end

  def update
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    if item.user_id == current_user.id
      item.destroy
      redirect_to("/")
    end
  end

  private
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def product_params
    params.require(:product).permit(:name, :price, images_attributes: [:src, :_destroy, :id])
  end
  
  def set_product
    @product = Product.find(params[:id])
  end

end

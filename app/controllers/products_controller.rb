class ProductsController < ApplicationController
  def index
    @product = Product.all
  end

  def show
    @product = Product.find{params[:id]}
  end

  def buy
  end

  def destroy
    item = Item.find(params[:id])
    if item.user_id == current_user.id
      item.destroy
      redirect_to("/")
    end
  end
end

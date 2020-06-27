class ProductsController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    @product = Product.all
  end

  def show
  end

  def buy
  end

  def destroy
    product = Prouduct.find(params[:id])
    if product.user_id == current_user.id
      product.destroy
      redirect_to("/")
    end
  end

  private
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end

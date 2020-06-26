class ProductsController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    @product = Product.all
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
end

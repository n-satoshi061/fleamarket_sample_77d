class ProductsController < ApplicationController
  def index
  end

  def destroy
    item = Prouduct.find(params[:id])
    if product.user_id == current_user.id
      product.destroy
      redirect_to("/")
    end
  end
end

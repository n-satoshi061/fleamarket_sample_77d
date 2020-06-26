class ProductsController < ApplicationController
  def index
    @product = Product.all
  end

  def destroy
    item = Prouduct.find(params[:id])
    if product.user_id == current_user.id
      product.destroy
      redirect_to("/")
    end
  end
end

class UsersController < ApplicationController

  def index
  end

  def logout_page
  end

  def delete_product
    @products = Product.where(seller_id: current_user.id).order(id: "DESC")
  end
end

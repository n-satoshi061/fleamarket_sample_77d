class UsersController < ApplicationController

  def index
  end

  def logout_page
  end

  def delete_product
    @user = current_user
    @products = Product.where(seller_id: @user.id).order(id: "DESC")
  end
end

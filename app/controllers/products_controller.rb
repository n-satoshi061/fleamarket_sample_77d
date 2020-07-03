class ProductsController < ApplicationController
  before_action :move_to_index, except: :index


  def index
    @product = Product.all
  end

  def new
    @product = Product.new
    @product.images.new
    @category_parent_first = Category.where(ancestry: nil)
  end

  # 以下全て、formatはjsonのみ
  # 親カテゴリーが選択された後に動くアクション
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    # ここでfind_byを使うことでレディーしか取れてなかった
    @category_children = Category.find(params[:parent_id]).children
  end

  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find(params[:child_id]).children
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      @category_parent_first = Category.where(ancestry: nil)
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
    # カテゴリ名を取得するために@categoryにレコードをとってくる
    @category = @product.category
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

  private
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def product_params
    params.require(:product).permit(:title, :introduction, :price, :from_area, :delivery_person, :delivery_leadtime, :delivery_way, :status, :category_id, images_attributes: [:image, :_destroy, :id]).merge(seller_id: current_user.id)
  end

  
end

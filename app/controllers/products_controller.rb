class ProductsController < ApplicationController
  before_action :move_to_index, except: :index
  before_action :set_item, only:[:show, :destroy, :edit, :update, :purchase, :payment]

  def index
    @product = Product.all
  end

  def new
    @item = Item.new
    @item.item_images.new

    #セレクトボックスの初期値設定
    @category_parent_array = ["---"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    @category_parent_array = Category.where(ancestry: nil)
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

  def show
  end

  def buy
  end

  def destroy
    product = Product.find(params[:id])
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

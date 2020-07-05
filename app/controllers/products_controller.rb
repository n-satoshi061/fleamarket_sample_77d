class ProductsController < ApplicationController

  require 'payjp'


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
    @address = Address.where(user_id: current_user.id).first
    @product = Product.find(params[:id])
    @image = Image.find(@product[:id])

    card = Card.where(user_id: current_user.id).first
    if card.blank?
      @default_card_information = nil
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    amount: params[:buy_price],
    customer: card.customer_id,
    currency: 'jpy',
    )
    redirect_to root_path
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.seller_id == current_user.id &&  @product.destroy
      redirect_to  delete_product_users_path
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

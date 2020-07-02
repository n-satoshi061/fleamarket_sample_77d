class ProductsController < ApplicationController

  require 'payjp'

  def index
    @product = Product.all
  end

  def new
    @product = Product.new
    @product.images.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
    redirect_to root_path
    else
    render :new
    end
  end

  def show
    @product = Product.find(params[:id])
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
    params.require(:product).permit(:name, :price, images_attributes: [:src, :_destroy, :id])
  end

  def set_product
    @product = Product.find(params[:id])
  end
end

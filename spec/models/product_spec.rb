require 'rails_helper'


RSpec.describe Product, type: :model do 
  describe '#create' do 
    before do
      @category = FactoryBot.create(:category)
    end


    it "商品情報が全て存在すれば登録できること" do  
      product = build(:product) 
      binding.pry
      expect(product).to be_valid 
    end


    it "imageが１枚以上ない場合は登録できないこと" do
      product = build(:product)
      image = build(:image, product_id: product[:id], image: nil)
      image.valid?
      expect(image.errors[:image]).to include("can't be blank")
    end


    it "imageが２枚以上ある場合は登録できること" do
      product = build(:product)
      product.images << build_list(:image, 2)
    	product.valid?
    	expect(product).to be_valid
    end


    it "priceがない場合は登録できないこと" do 
      category = create(:category)
      product = build(:product, category_id: category[:id], price: nil)
      product.valid?
      expect(product.errors[:price]).to include("can't be blank")
    end


    it "titleがない場合は登録できないこと" do 
      product = build(:product, title: nil)
    	product.valid?
    	expect(product.errors[:title]).to include("can't be blank")
    end


    it "introductionがない場合は登録できないこと" do 
      product = build(:product, introduction: nil)
    	product.valid?
    	expect(product.errors[:introduction]).to include("can't be blank")
    end


    it "categoryがない場合は登録できないこと" do 
      product = build(:product, category: nil)
    	product.valid?
    	expect(product.errors[:category]).to include("must exist")
    end


    it "statusがない場合は登録できないこと" do 
      product = build(:product, status: nil)
    	product.valid?
    	expect(product.errors[:status]).to include("can't be blank")
    end


    it "delivery_personがない場合は登録できないこと" do
      product = build(:product, delivery_person: nil)
    	product.valid?
    	expect(product.errors[:delivery_person]).to include("can't be blank")
    end 


    it "from_areaがない場合は登録できないこと" do 
      product = build(:product, from_area: nil)
    	product.valid?
    	expect(product.errors[:from_area]).to include("can't be blank")
    end


    it "delivery_leadtimeがない場合は登録できないこと" do 
      product = build(:product, delivery_leadtime: nil)
    	product.valid?
    	expect(product.errors[:delivery_leadtime]).to include("can't be blank")
    end


  end
end 
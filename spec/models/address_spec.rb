require 'rails_helper'

describe Address do
  describe '#create' do
    it "商品送付先住所情報が全て存在すれば登録できること" do
      user = create(:user)
      address = build(:address, user_id: user[:id])
      expect(address).to be_valid
    end

    # presence_check
    it " postal_codeがない場合は登録できないこと" do
      address = build(:address, postal_code: nil)
      address.valid?
      expect(address.errors[:postal_code]).to include("can't be blank")
    end

    it " prefectureがない場合は登録できないこと" do
      address = build(:address, prefecture: nil)
      address.valid?
      expect(address.errors[:prefecture]).to include("can't be blank")
    end

    it " cityがない場合は登録できないこと" do
      address = build(:address, city: nil)
      address.valid?
      expect(address.errors[:city]).to include("can't be blank")
    end

    it " blockがない場合は登録できないこと" do
      address = build(:address, block: nil)
      address.valid?
      expect(address.errors[:block]).to include("can't be blank")
    end
  end
end

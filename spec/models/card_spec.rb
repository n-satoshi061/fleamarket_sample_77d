require 'rails_helper'

describe Card do
  describe '#new' do
    it "クレジットカード情報が全て存在すれば登録できること" do
      user = create(:user)
      card = build(:card, user_id: user[:id])
      expect(card).to be_valid
    end

    it "PAYJPで生成されたcustomer_idがない場合は登録できないこと" do
      card = build(:card, customer_id: "")
      card.valid?
      expect(card.errors[:customer_id]).to include("can't be blank")
    end

    it "PAYJPで生成されたcard_idがない場合は登録できないこと" do
      card = build(:card, card_id: "")
      card.valid?
      expect(card.errors[:card_id]).to include("can't be blank")
    end
  end
end

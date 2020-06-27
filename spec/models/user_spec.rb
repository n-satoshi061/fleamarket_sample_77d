require 'rails_helper'

describe User do
  describe '#create' do
    it "ユーザ情報が全て存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    # presence_check
    it " nicknameがない場合は登録できないこと" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "emailがない場合は登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("can't be blank")
    end

    it "birthyearがない場合は登録できないこと" do
      user = build(:user, birthyear: nil)
      user.valid?
      expect(user.errors[:birthyear]).to include("can't be blank")
    end

    it "birthmonthがない場合は登録できないこと" do
      user = build(:user, birthmonth: nil)
      user.valid?
      expect(user.errors[:birthmonth]).to include("can't be blank")
    end

    it "birthdayがない場合は登録できないこと" do
      user = build(:user, birthday: nil)
      user.valid?
      expect(user.errors[:birthday]).to include("can't be blank")
    end

    it "family_nameがない場合は登録できないこと" do
      user = build(:user, family_name: nil)
      user.valid?
      expect(user.errors[:family_name]).to include("can't be blank")
    end

    it "personal_nameがない場合は登録できないこと" do
      user = build(:user, personal_name: nil)
      user.valid?
      expect(user.errors[:personal_name]).to include("can't be blank")
    end

    it "family_name_kanaがない場合は登録できないこと" do
      user = build(:user, family_name_kana: nil)
      user.valid?
      expect(user.errors[:family_name_kana]).to include("can't be blank")
    end

    it "personal_name_kanaがない場合は登録できないこと" do
      user = build(:user, personal_name_kana: nil)
      user.valid?
      expect(user.errors[:personal_name_kana]).to include("can't be blank")
    end

    it "post_family_nameがない場合は登録できないこと" do
      user = build(:user, post_family_name: nil)
      user.valid?
      expect(user.errors[:post_family_name]).to include("can't be blank")
    end

    it "post_personal_nameがない場合は登録できないこと" do
      user = build(:user, post_personal_name: nil)
      user.valid?
      expect(user.errors[:post_personal_name]).to include("can't be blank")
    end

    it "post_family_name_kanaがない場合は登録できないこと" do
      user = build(:user, post_family_name_kana: nil)
      user.valid?
      expect(user.errors[:post_family_name_kana]).to include("can't be blank")
    end

    it "post_personal_name_kanaがない場合は登録できないこと" do
      user = build(:user, post_personal_name_kana: nil)
      user.valid?
      expect(user.errors[:post_personal_name_kana]).to include("can't be blank")
    end

    # uniqueness_check
    it " 重複したemailが存在する場合は登録できないこと " do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    # format_check
    ## email
    it " emailに@がなければ登録できないこと" do
      user = build(:user, email: "testgmail.com")
      user.valid?
      expect(user.errors[:email]).to include("is invalid")
    end

    it " emailにドメインがなければ登録できないこと" do
      user = build(:user, email: "test@gmail")
      user.valid?
      expect(user.errors[:email]).to include("is invalid")
    end

    it " emailに@とドメインがあれば登録できること" do
      user = build(:user, email: "test@gmail.com")
      expect(user).to be_valid
    end

    ## password
    it " passwordに7桁以上であるが数値がなければ登録できないこと" do
      user = build(:user, password: "aaaaaaa", password_confirmation: "aaaaaaa")
      user.valid?
      expect(user.errors[:password]).to include("is invalid")
    end

    it " passwordに7桁以上であるがアルファベットがなければ登録できないこと" do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      user.valid?
      expect(user.errors[:password]).to include("is invalid")
    end

    it " passwordに7桁以上でなければ登録できないこと" do
      user = build(:user, password: "12345a", password_confirmation: "12345a")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 7 characters)", "is invalid")
    end

    it " passwordに7桁以上でかつ数値とアルファベットが1文字以上含まれれば登録できること" do
      user = build(:user, password: "1234567a", password_confirmation: "1234567a")
      expect(user).to be_valid
    end

    ## name
    it " family_nameに平仮名、カタカナ、漢字以外の入力があった場合は登録できないこと" do
      user = build(:user, family_name: "test123")
      user.valid?
      expect(user.errors[:family_name]).to include("is invalid")
    end

    it " family_nameに平仮名、カタカナ、漢字の入力であった場合は登録できること" do
      user = build(:user, family_name: "テストてすと確認")
      expect(user).to be_valid
    end

    it " family_name_kanaにカナ以外の入力があった場合は登録できないこと" do
      user = build(:user, family_name_kana: "てすと確認")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("is invalid")
    end

    it " family_name_kanaにカタカナ入力であった場合は登録できること" do
      user = build(:user, family_name: "テスト")
      expect(user).to be_valid
    end

    it " personal_nameに平仮名、カタカナ、漢字以外の入力があった場合は登録できないこと" do
      user = build(:user, personal_name: "test123")
      user.valid?
      expect(user.errors[:personal_name]).to include("is invalid")
    end

    it " personal_nameに平仮名、カタカナ、漢字の入力であった場合は登録できること" do
      user = build(:user, personal_name: "テストてすと確認")
      expect(user).to be_valid
    end

    it " personal_name_kanaにカナ以外の入力があった場合は登録できないこと" do
      user = build(:user, personal_name_kana: "てすと確認")
      user.valid?
      expect(user.errors[:personal_name_kana]).to include("is invalid")
    end

    it " personal_name_kanaにカタカナ入力であった場合は登録できること" do
      user = build(:user, personal_name_kana: "テスト")
      expect(user).to be_valid
    end

    it " post_family_nameに平仮名、カタカナ、漢字以外の入力があった場合は登録できないこと" do
      user = build(:user, post_family_name: "test123")
      user.valid?
      expect(user.errors[:post_family_name]).to include("is invalid")
    end

    it " post_family_nameに平仮名、カタカナ、漢字の入力であった場合は登録できること" do
      user = build(:user, post_family_name: "テストてすと確認")
      expect(user).to be_valid
    end

    it " post_family_name_kanaにカナ以外の入力があった場合は登録できないこと" do
      user = build(:user, post_family_name_kana: "てすと確認")
      user.valid?
      expect(user.errors[:post_family_name_kana]).to include("is invalid")
    end

    it " post_family_name_kanaにカタカナ入力であった場合は登録できること" do
      user = build(:user, post_family_name: "テスト")
      expect(user).to be_valid
    end

    it " post_personal_nameに平仮名、カタカナ、漢字以外の入力があった場合は登録できないこと" do
      user = build(:user, post_personal_name: "test123")
      user.valid?
      expect(user.errors[:post_personal_name]).to include("is invalid")
    end

    it " post_personal_nameに平仮名、カタカナ、漢字の入力であった場合は登録できること" do
      user = build(:user, post_personal_name: "テストてすと確認")
      expect(user).to be_valid
    end

    it " post_personal_name_kanaにカナ以外の入力があった場合は登録できないこと" do
      user = build(:user, post_personal_name_kana: "てすと確認")
      user.valid?
      expect(user.errors[:post_personal_name_kana]).to include("is invalid")
    end

    it " post_personal_name_kanaにカタカナ入力であった場合は登録できること" do
      user = build(:user, post_personal_name_kana: "テスト")
      expect(user).to be_valid
    end
  end
end

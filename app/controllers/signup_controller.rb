class SignupController < ApplicationController

  # 都道府県リスト
  $pref_array = [
    "北海道", "青森県", "岩手県", "宮城県", "秋田県", "山形県",
    "福島県", "茨木県", "栃木県", "群馬県", "埼玉県", "千葉県",
    "東京都", "神奈川県", "新潟県", "富山県", "石川県", "福井県",
    "山梨県", "長野県", "岐阜県", "静岡県", "愛知県", "三重県",
    "滋賀県", "京都府", "大阪府", "兵庫県", "奈良県", "和歌山県",
    "鳥取県", "島根県", "岡山県", "広島県", "山口県", "徳島県",
    "香川県", "愛媛県", "高知県", "福岡県", "佐賀県", "長崎県",
    "熊本県", "大分県", "宮崎県", "鹿児島県", "沖縄県"
  ];


  def create
    # session配列にユーザデータを保持
    session[:tel] = user_params[:tel]
    session[:post_family_name] = user_params[:post_family_name]
    session[:post_personal_name] = user_params[:post_personal_name]
    session[:post_family_name_kana] = user_params[:post_family_name_kana]
    session[:post_personal_name_kana] = user_params[:post_personal_name_kana]
    session[:postal_code] = address_params[:postal_code]
    session[:prefecture] = address_params[:prefecture]
    session[:city] = address_params[:city]
    session[:block] = address_params[:block]
    session[:building] = address_params[:building]
    # Usersテーブルカラム
    @user_info = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      family_name: session[:family_name],
      personal_name: session[:personal_name],
      family_name_kana: session[:family_name_kana],
      personal_name_kana: session[:personal_name_kana],
      birthyear: session[:birthyear],
      birthmonth: session[:birthmonth],
      birthday: session[:birthday],
      tel: session[:tel],
      post_family_name: session[:post_family_name],
      post_personal_name: session[:post_personal_name],
      post_family_name_kana: session[:post_family_name_kana],
      post_personal_name_kana: session[:post_personal_name_kana]
    )
    # Addressesテーブルカラム
    @address_info = Address.new(
      # address_info
      postal_code: session[:postal_code],
      prefecture: session[:prefecture],
      city: session[:city],
      block: session[:block],
      building: session[:building]
    )
    # 登録
    if @user_info.save
      id = @user_info.id
      session[:id] = id
      @address_info[:user_id] = id
      @address_info.save

      sign_in User.find(session[:id]) unless user_signed_in?
      redirect_to root_path
    else
      redirect_to step1_signup_index_path
    end
  end

  def step1
    @user_info = User.new
    @emails = User.select(:email)
  end

  def step2
    # session配列にユーザデータを保持
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:family_name] = user_params[:family_name]
    session[:personal_name] = user_params[:personal_name]
    session[:family_name_kana] = user_params[:family_name_kana]
    session[:personal_name_kana] = user_params[:personal_name_kana]
    session[:birthyear] = user_params[:birthyear]
    session[:birthmonth] = user_params[:birthmonth]
    session[:birthday] = user_params[:birthday]
    @user_info = User.new
    @address_info = Address.new
  end

  private
  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :password_confirmation,
      :family_name,
      :personal_name,
      :family_name_kana,
      :personal_name_kana,
      :birthyear,
      :birthmonth,
      :birthday,
      :tel,
      :post_family_name,
      :post_personal_name,
      :post_family_name_kana,
      :post_personal_name_kana,
    )
  end

  def address_params
    params.require(:user).require(:address).permit(
      :postal_code,
      :prefecture,
      :city,
      :block,
      :building
    )
  end
end

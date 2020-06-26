class User < ApplicationRecord

    # バリデーション用正規表現
    VALID_EMAIL_REGEX = /\A[-a-z0-9~!$%^&*_=+}{\'?]+(\.[-a-z0-9~!$%^&*_=+}{\'?]+)*@([a-z0-9_][-a-z0-9_]*(\.[-a-z0-9_]+)*\.(aero|arpa|biz|com|coop|edu|gov|info|int|mil|museum|name|net|org|pro|travel|mobi|[a-z][a-z])|([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}))(:[0-9]{1,5})?\z/i
    VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
    VALID_NAME_KANA_REGEX = /\A([ァ-ン]|ー)+\z/
    VALID_TEL_REGEX = /\A\d{3}-\d{4}-\d{4}$|^\d{11}\z/
    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,100}\z/i

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,  presence: true
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: { minimum: 7 }, format: { with: VALID_PASSWORD_REGEX }
  validates :password_confirmation, presence: true, length: { minimum: 7 }, format: { with: VALID_PASSWORD_REGEX }
  validates :birthyear, presence: true
  validates :birthmonth, presence: true
  validates :birthday, presence: true
  validates :family_name, presence: true, format: { with: VALID_NAME_REGEX }
  validates :personal_name, presence: true, format: { with: VALID_NAME_REGEX }
  validates :family_name_kana, presence: true, format: { with: VALID_NAME_KANA_REGEX }
  validates :personal_name_kana, presence: true, format: { with: VALID_NAME_KANA_REGEX }
  validates :tel, format: { with: VALID_TEL_REGEX }
  validates :post_family_name, presence: true, format: { with: VALID_NAME_REGEX }
  validates :post_personal_name, presence: true, format: { with: VALID_NAME_REGEX }
  validates :post_family_name_kana, presence: true, format: { with: VALID_NAME_KANA_REGEX }
  validates :post_personal_name_kana, presence: true, format: { with: VALID_NAME_KANA_REGEX }

  has_one :card
  has_many :products
  has_many :addresses
end

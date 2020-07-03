class Product < ApplicationRecord
  
  has_many :images, dependent: :destroy
  belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id', optional: true
  belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
  belongs_to :category
  accepts_nested_attributes_for :images, allow_destroy: true


  validates :title,               presence: true
  validates :introduction,        presence: true
  validates :status ,             presence: true
  validates :delivery_way,        presence: true
  validates :delivery_person,     presence: true
  validates :from_area,           presence: true
  validates :delivery_leadtime,   presence: true
  validates :price,               presence: true, inclusion: 300..9999999
end

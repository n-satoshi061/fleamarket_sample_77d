class Product < ApplicationRecord
  has_many :images
  belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id', optional: true
  belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
  belongs_to :category
  accepts_nested_attributes_for :images, allow_destroy: true
end

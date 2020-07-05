class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :deliveryperson
  belongs_to_active_hash :deliveryleadtime
  belongs_to_active_hash :deliveryway
  belongs_to_active_hash :productstatus

  has_many :images, dependent: :destroy
  belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id', optional: true
  belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
  belongs_to :category
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :title, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :prefecture_id, presence: true
  validates :deliveryperson_id, presence: true
  validates :deliveryleadtime_id, presence: true
  validates :deliveryway_id, presence: true
  validates :productstatus_id, presence: true
  validates :category_id, presence: true
  validates :images, presence: true
end

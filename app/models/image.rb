class Image < ApplicationRecord
  belongs_to :product, optional: true, dependent: :destroy
  mount_uploader :image, ImageUploader

  validates :image, presence: true
end


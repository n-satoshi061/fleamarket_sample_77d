class Image < ApplicationRecord
  belongs_to :product, optional: true, dependent: :destroy
  mount_uploader :src, ImageUploader
end

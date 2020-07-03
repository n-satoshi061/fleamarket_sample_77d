class Image < ApplicationRecord
  belongs_to :product, optional: true
  mount_uploader :src, ImageUploader
end

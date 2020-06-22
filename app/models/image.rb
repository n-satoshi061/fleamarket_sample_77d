class Image < ApplicationRecord
  belongs_to :product, optional: true, dependent: :destroy
end

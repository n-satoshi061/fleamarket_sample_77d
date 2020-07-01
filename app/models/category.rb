class Category < ApplicationRecord
  has_many :products
  has_ancestry

  validates :text, presence: true
end

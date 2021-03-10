class Product < ApplicationRecord
  validates :name, :size, :price, :quantity, :description, :image_url, presence: true
end

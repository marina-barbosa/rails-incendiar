class Product < ApplicationRecord
  has_one_attached :image

  # validates :name, presence: true
  # validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  # validates :stock, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :name, :price, :stock, presence: true
  validates :price, :stock, numericality: { greater_than_or_equal_to: 0 }
  validates :stock, numericality: { only_integer: true }
end

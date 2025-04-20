class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  has_rich_text :description
  has_many_attached :imags
  
  has_many :cart_items
  has_many :users, through: :cart_items  # Add this line to connect users via cart_items

  has_many :order_items
  has_many :orders, through: :order_items
end

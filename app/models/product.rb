class Product < ApplicationRecord
  has_rich_text :description
  has_many_attached :imags
  
  has_many :cart_items
  has_many :users, through: :cart_items  # Add this line to connect users via cart_items

  has_many :order_items
  has_many :orders, through: :order_items
end

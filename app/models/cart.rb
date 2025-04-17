class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items
  has_many :products, through: :cart_items

  # Add helper method to calculate total price of cart
  def total_price
    cart_items.includes(:product).sum("cart_items.quantity * products.price")
  end
end

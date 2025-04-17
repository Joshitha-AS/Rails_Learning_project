class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :products, through: :cart_items
  before_save :calculate_total_price

  private

  def calculate_total_price
    self.total_price = order_items.sum { |item| item.quantity * item.product.price }
  end

  def total_price
    cart_items.includes(:product).sum("cart_items.quantity * products.price")
  end
end

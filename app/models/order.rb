class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :products, through: :cart_items
  before_save :calculate_total_price



  def calculate_total_price
    self.total_price = order_items.sum { |item| item.quantity * item.product.price }
  end

  def total_price
    order_items.includes(:product).sum("order_items.quantity * products.price")
  end
  
end
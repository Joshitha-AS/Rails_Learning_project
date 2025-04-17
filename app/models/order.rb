class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  before_save :calculate_total_price

  private

  def calculate_total_price
    self.total_price = order_items.sum { |item| item.quantity * item.product.price }
  end
end

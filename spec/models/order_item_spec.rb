require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  let(:product) { Product.create(name: "Book", price: 20) }
  let(:order) { Order.create(user: User.create(email: "test@example.com", password: "123456")) }

  it "calculates subtotal" do
    order_item = OrderItem.create(product: product, order: order, quantity: 3)
    expect(order_item.subtotal).to eq(60)  # 3 * 20
  end
end

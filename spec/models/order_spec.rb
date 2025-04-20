require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:user) { User.create(email: "customer@example.com", password: "password") }

  it "is valid with a user" do
    order = Order.new(user: user)
    expect(order).to be_valid
  end

  it "calculates total price" do
    order = Order.create(user: user)
    product1 = Product.create(name: "Laptop", price: 1000)
    product2 = Product.create(name: "Mouse", price: 50)

    order.order_items.create(product: product1, quantity: 1)
    order.order_items.create(product: product2, quantity: 2)

    expect(order.total_price).to eq(1100) 
  end
end

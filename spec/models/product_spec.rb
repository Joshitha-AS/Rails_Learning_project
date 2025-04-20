require 'rails_helper'

RSpec.describe Product, type: :model do
  it "is valid with a name and price" do
    product = Product.new(name: "T-Shirt", price: 19.99)
    expect(product).to be_valid
  end

  it "is invalid without a name" do
    product = Product.new(price: 19.99)
    expect(product).not_to be_valid
  end

  it "is invalid with a negative price" do
    product = Product.new(name: "Shoes", price: -5)
    expect(product).not_to be_valid
  end
end

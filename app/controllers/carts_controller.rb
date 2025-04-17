class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart = current_user.cart || current_user.create_cart
    render json: @cart, include: :products
  end

  def add_product
    @cart = current_user.cart || current_user.create_cart
    product = Product.find(params[:product_id])

    # Check if the product already exists in the cart
    cart_item = @cart.cart_items.find_by(product_id: product.id)
    if cart_item
      cart_item.update(quantity: cart_item.quantity + 1)
    else
      @cart.cart_items.create(product: product, quantity: 1)
    end

    render json: @cart, include: :products
  end

  def remove_product
    @cart = current_user.cart
    cart_item = @cart.cart_items.find(params[:cart_item_id])
    cart_item.destroy

    render json: @cart, include: :products
  end

  def checkout
    @cart = current_user.cart
    order = @cart.orders.create(total_price: @cart.total_price)

    # Transfer cart items to order_items
    @cart.cart_items.each do |cart_item|
      order.order_items.create(product: cart_item.product, quantity: cart_item.quantity)
    end

    # Clear the cart after checkout
    @cart.cart_items.destroy_all

    render json: order, include: :products
  end
end

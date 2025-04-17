class UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end

  def orders
    user = User.find(params[:id])
    render json: user.orders
  end
end

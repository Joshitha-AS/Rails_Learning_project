class User < ApplicationRecord
  has_many :orders
  has_many :cart_items
  has_many :products, through: :cart_items
  has_one :cart
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

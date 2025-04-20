require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with email and password" do
    user = User.new(email: "user@example.com", password: "password")
    expect(user).to be_valid
  end

  it "is invalid without an email" do
    user = User.new(password: "password")
    expect(user).not_to be_valid
  end
end

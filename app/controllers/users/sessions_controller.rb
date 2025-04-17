class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    if resource.role == "admin"
      render json: { message: "Logged in successfully", role: "admin", redirect_to: "/add-product" }, status: :ok
    else
      render json: { message: "Logged in successfully", role: "user", redirect_to: "/products" }, status: :ok
    end
  end

  def respond_to_on_destroy
    render json: { message: "Logged out successfully." }, status: :ok
  end
end

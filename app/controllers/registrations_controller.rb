class RegistrationsController < Devise::RegistrationsController
  respond_to :html, :json

  def new
    render '../views/shared/_sign_up'
  end

  def create
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password])
    super
  end
  
end

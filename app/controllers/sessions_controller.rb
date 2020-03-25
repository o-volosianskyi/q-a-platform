class SessionsController < Devise::SessionsController
  respond_to :html, :json

  def new
    render '../views/shared/_sign_in'
  end
  
  def create
    resource = User.find_for_database_authentication(email: params[:user][:email])
    return invalid_login_attempt unless resource
  
    if resource.valid_password?(params[:user][:password])
      sign_in :user, resource
      return
    end
  
    invalid_login_attempt
  end

  def invalid_login_attempt
    set_flash_message(:alert, :invalid)
    render json: flash[:alert], status: 401
  end
end

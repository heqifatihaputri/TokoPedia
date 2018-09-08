class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :address, :telephone)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :address, :telephone, :current_password)
  end

end
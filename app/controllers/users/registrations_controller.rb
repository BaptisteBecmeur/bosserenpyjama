class Users::RegistrationsController < Devise::RegistrationsController

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def after_update_path_for(resource)
    user_path(resource)
  end

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :city, :email, :password, :password_confirmation, :picture)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :picture, :city, :email, :password, :password_confirmation, :biography, :website, :social_link1, :social_link2, :social_link3)
  end
end




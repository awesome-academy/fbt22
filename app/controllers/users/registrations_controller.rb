class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, only: %i(create update)

  protected

  def configure_permitted_parameters
    added_attrs = [:picture, :firstname, :lastname, :phone, :address]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end

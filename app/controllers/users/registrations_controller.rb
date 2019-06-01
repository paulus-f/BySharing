
class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    user_params = params.permit(:email, :first_name, :last_name, :password, :password_confirmation).to_h
    build_resource(user_params)
    resource.save
    render_resource(resource)
  end
end
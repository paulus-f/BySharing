class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_action :verify_authenticity_token

  respond_to :json

  def create
    user_params = params.permit(:email, :first_name, :last_name, :password, :password_confirmation).to_h
    build_resource(user_params)
    if resource.save
      render json: { message: 'success', status: 200 }
    else
      render json: { message: 'not valided', status: 401 }
    end
  end
end

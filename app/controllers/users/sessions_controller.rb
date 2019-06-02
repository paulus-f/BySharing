class Users::SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token

  respond_to :json

  # POST /resource/sign_in
  def create
    resource = User.find_by(email: params[:email])
    if resource&.valid_password?(params[:password])
      sign_in(resource_name, resource)
      render json: { message: 'success' }, status: 200
    else
      render json: { message: 'reject' }, status: 401
    end
  end

  def destroy
    (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    render json: 'OK', status: 200
  end

  private

  def respond_with(resource, _opts = {})
    render json: resource
  end

  def respond_to_on_destroy
    head :no_content
  end
end


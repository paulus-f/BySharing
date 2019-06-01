class Users::SessionsController < Devise::SessionsController

  respond_to :json

  # POST /resource/sign_in
  def create
    user_params = params.permit(:email, :password).to_h
    self.resource = warden.authenticate!(user_params.merge!(scope: :user))
    set_flash_message(:notice, :signed_in) if is_flashing_format?
    sign_in(resource_name, resource)
    respond_with(resource) do |format|
      format.json { render json: { redirect_url: after_sign_in_path_for(resource)}, status: 200 }
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


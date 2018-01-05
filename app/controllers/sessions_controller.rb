class SessionsController < ApplicationController
  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if user.nil?
      payload = {
        error: "No such user exists, or password was incorrect.",
        status: 400
      }
      render :json => payload, :status => :bad_request
    else
      login!(user)
      jwt = Auth.issue({user: user.id})
      render json: {
        jwt: jwt,
        status: 200
      }
    end
  end

  def destroy
    logout!
    redirect_to session_new_url
  end

  private
  def auth_params
    params.require(:username).permit(:password)
  end
end

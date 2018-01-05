class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def login!(user)
    @current_user = user
    session[:session_token] = user.session_token
  end

  def require_current_user!
    redirect_to session_new_url if current_user.nil?
  end

  def logout
    current_user.try(:reset_session_token!)
    session[:session_token] = nil
  end

  # def current_user
  #   return nil if session[:session_token].nil?
  #   @current_user ||= User.find_by_session_token(session[:session_token])
  # end

  # New stuff
  def logged_in?
    !!current_user
  end

  def current_user
    if auth_present?
      user = User.find(auth["user"])
      if user
        @current_user ||= user
      end
    end
  end


  def authenticate
    render json: {error: "unauthorized"}, status: 401
      unless logged_in?
  end

  private
    def token
      request.env["HTTP_AUTHORIZATION"].scan(/Bearer
        (.*)$/).flatten.last
    end

    def auth
      Auth.decode(token)
    end

    def auth_present?
      puts request.env
      # !!request.env.fetch("HTTP_AUTHORIZATION", "").scan(/Bearer/).flatten.first
    end
  end
end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :require_login, :require_params

  def current_user
    @current_user ||= session[:name]
  end

  def require_login
    redirect_to login_path unless session.include? :name
  end

  def require_params
    return redirect_to login_path unless params[:name].present?
  end
end

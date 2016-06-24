class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def restrict_access
    if !current_user
      flash[:alert] = "You must log in."
      redirect_to new_session_path
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def is_admin?
    admin_authorization = current_user && current_user.admin
    #unless admin_authorization
    #  flash[:error] = "You must be logged in as admin to access this section"
    #end
    admin_authorization
  end

  def is_impersonating?
    session[:original_user] != nil
  end

  helper_method :current_user
  helper_method :is_admin?
  helper_method :is_impersonating?

end

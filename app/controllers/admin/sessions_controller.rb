class Admin::SessionsController < ApplicationController

  def impersonate
    flash[:notice] = "Welcome to this user account #{params[:id]}"
    session[:original_user] = session[:user_id]
    session[:user_id] = params[:id]
    redirect_to '/'
  end

end

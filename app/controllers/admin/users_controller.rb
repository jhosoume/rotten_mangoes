class Admin::UsersController < ApplicationController

  before_filter :is_admin?
  
  def edit
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

  protected

  def is_admin?
    admin_authorization = current_user && current_user.admin
    unless admin_authorization
      flash[:error] = "You must be logged in as admin to access this section"
      redirect_to root_url
    end
    admin_authorization
  end

end

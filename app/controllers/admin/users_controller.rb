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
    current_user ? current_user.admin : false
    redirect_to root_url
  end

end

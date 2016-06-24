class Admin::UsersController < ApplicationController

  before_filter :auth_admin
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to admin_user_path(@user)
    else
      render :edit
    end
  end

  def index
    @users = User.order(:created_at)
  end

  def destroy
    @user = User.find(params[:id])
    UserMailer.delete_warning(@user).deliver_later
    @user.destroy
    redirect_to admin_users_path
  end

  def show
    @user = User.find(params[:id])
  end

  protected

  def user_params
    params.require(:user).permit(
      :email, :firstname, :lastname, :password, :password_confirmation, :admin
    )
  end

  def auth_admin
    unless is_admin?
      flash[:error] = "You must be logged in as admin to access this section"
      redirect_to root_path
    end
  end

end

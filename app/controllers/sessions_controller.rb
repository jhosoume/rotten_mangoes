class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to movies_path, notice: "Welcome back, #{user.firstname}!"
    else
      flash.now[:alert] = "Log in failed..."
      render :new
    end
  end

  def destroy
    if is_impersonating?
      session[:user_id] = session[:original_user]
      session.delete(:original_user)
      flash[:notice] = "Welcome back"
      redirect_to :root
    else
      reset_session if current_user
      redirect_to movies_path, notice: "Adios!"
    end
  end

end

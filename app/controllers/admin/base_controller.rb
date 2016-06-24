class Admin::BaseController < ApplicationController

  before_action :auth_admin

  def auth_admin
    unless is_admin?
      flash[:error] = "You must be logged in as admin to access this section"
      redirect_to root_path
    end
  end

end

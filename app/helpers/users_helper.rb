module UsersHelper
  def form_namespace
    is_admin? ? [:admin, @user] : @user
  end

end

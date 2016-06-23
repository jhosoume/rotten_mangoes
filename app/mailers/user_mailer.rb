class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def delete_warning(user)
    @user = user
    mail(to: @user.email, subject:'Your account has been deleted.')
  end
end

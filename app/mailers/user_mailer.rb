class UserMailer < ActionMailer::Base
  default from: "notifications@example.com"

  def activation_email(user)
    @user = user
    @url = users_activate_url(@user) + "?token=#{@user.user_token}"
    mail(to: @user.email, subject: 'Activate Your Account')
  end
end

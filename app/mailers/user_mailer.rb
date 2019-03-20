class UserMailer < ApplicationMailer
  default from: 'no-reply@perma-culture.fr'

  def welcome_email(user)
    @user = user

    @url  = 'http://perma-culture.herokuapp.com/users/sign_in' 

    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end
end

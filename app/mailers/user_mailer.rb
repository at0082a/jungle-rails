class UserMailer < ApplicationMailer

    default from: 'no-reply@jungle.com'
 
    def welcome_email(user)
        @user = user
        mail(to: @user.email, subject: 'Thank you for your purchase')
    end

end

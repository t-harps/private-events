class UserMailer < ApplicationMailer
	default from: 'notification@example.com'

	def welcome_email(user)
		@user = user
		@url = 'http://localhost/3000'
		mail(to: @user.email, subject: 'Welcome to the private events site')
	end
end

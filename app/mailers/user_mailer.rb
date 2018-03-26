class UserMailer < ApplicationMailer

  def new_follower(user)
    @email = user.email
    mail to: user.email, subject: "You have a new follower!"
  end

end

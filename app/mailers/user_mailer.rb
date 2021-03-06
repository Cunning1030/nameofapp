class UserMailer < ApplicationMailer
  default from: "from@example.com"

  def contact_form(email, name, message)
    @message = message
    mail(from: email,
         to: 'cunningham1030@yahoo.com',
         subject: "A new contact form message from #{name}")
  end

  def welcome(user)
    @appname = "Free Market Music"
    mail(to: user.email,
         subject: "Welcome to #{@appname}!")
  end

  def order_placed(user, order)
    @user = user
    @order = order
    @product = order.product
    @appname = "Free Market Music"
    mail(to: user.email,
         subject: "Payment recieved by #{@appname}!")

  end

end

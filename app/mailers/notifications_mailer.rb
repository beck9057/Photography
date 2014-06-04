class NotificationsMailer < ActionMailer::Base
  default from: "kfalconer@gmail.com"
  
  default :to => "kfalconer@gmail.com"

   def new_message(message)
     @message = message
     mail(:subject => "[Kyle Falconer Photography] #{message.subject}")
   end
end

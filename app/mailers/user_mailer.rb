# encoding: utf-8
class UserMailer < ActionMailer::Base
  default from: "Pool Sites <noreply@poolsites.com.br>"
  
  def contact_us_form(contact_us)
    @contact_us = contact_us
    mail(to: 'diegomr86@gmail.com', reply_to: @contact_us.email, subject: "Mensagem do site www.poolsites.com.br | #{contact_us.name} ")
  end

end

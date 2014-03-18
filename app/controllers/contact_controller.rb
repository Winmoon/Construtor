class ContactController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def index
    @contact_us = ContactUs.new

    respond_to do |format|
      format.html
    end
  end
  def create

    @contact_us = ContactUs.new(contact_us_params)

    respond_to do |format|
      if @contact_us.valid?
        UserMailer.contact_us_form(@contact_us).deliver
        format.html do
          redirect_to contact_index_path, notice: 'Sua mensagem foi enviada com sucesso! Em breve entraremos em contato.'
        end
      else
        format.html { render action: "index" }
      end
    end
  end

  private
  def contact_us_params
    params.require(:contact_us).permit(:email, :name, :phone, :message)
  end
end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_editing

  def set_editing
    @editing = true if admin_signed_in?
    @page = self.controller_name
  end

end

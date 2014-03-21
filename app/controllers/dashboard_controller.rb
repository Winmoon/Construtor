class DashboardController < ApplicationController
  before_action :authenticate_user!
  layout 'application'

  def index
    @sites = current_user.sites
  end
end

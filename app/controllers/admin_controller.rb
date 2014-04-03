class AdminController < ApplicationController
  before_action :authenticate_admin!
  layout 'application'

  def index

  end

  def save_content

    @content = Content.where('site_id is null and template_id is null and page = ? and content_status = ? and target = ?', params[:page], :published, params[:target]).first

    if @content.present?
      @content.update_attributes(content: params[:content])
    else
      @content = Content.create(page: params[:page], content_status: :published, target: params[:target], content: params[:content])
    end

    if @content.errors.blank?
      render :json => @content, :status => :ok
    else
      head :unprocessable_entity # aka 422 status code
    end
  end
end

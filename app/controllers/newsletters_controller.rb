class NewslettersController < ApplicationController

  def create

    @newsletter = Newsletter.new(newsletter_params)

    respond_to do |format|
      if @newsletter.save
        format.html do
          redirect_to root_path, notice: t('controllers.newsletters.create.success')
        end
      else
        format.html do
          redirect_to root_path, alert: @newsletter.errors.to_a.to_sentence
        end
      end
    end
  end

  private
  def newsletter_params
    params.require(:newsletter).permit(:email)
  end
end

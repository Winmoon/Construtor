class TemplatesController < ApplicationController

  layout 'blank', only: :show

  def index
    @template_categories = TemplateCategory.order(:name)
    @templates = Template.order(:name)
    if params[:template_category_id].present?
      @templates = @templates.where(template_category_id: params[:template_category_id])
    end
    if params[:search].present?
      @templates = @templates.where('lower(name) like ?', "%#{params[:search].downcase.gsub(' ', '%')}%")
    end
    if params[:show_all].blank?
      @templates_count = @templates.count
      @templates = @templates.limit(4)
    end
  end

  def show
    @template = Template.find(params[:id])
  end
end

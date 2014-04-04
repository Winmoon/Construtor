class SitesController < DashboardController

  skip_before_filter :verify_authenticity_token, :only => [:save_content]

  layout 'edit_site', only: :edit

  def index
    @sites = current_user.sites.paginate(page: params[:page], per_page: 15)
  end

  def show
    @site = current_user.sites.find(params[:id])
    @page = params[:p] || 'index'
    @status = :published
    render "sites/#{@site.template.path}/#{@page}", layout: "sites/#{@site.template.path}"
  end

  def edit
    load_site
    @editing = true
    render "sites/#{@site.template.path}/#{@page}", layout: "sites/#{@site.template.path}"
  end

  def new

    @site = current_user.sites.new(site_params)

    respond_to do |format|
      if @site.save
        format.html { redirect_to edit_site_path(@site) }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @site = current_user.sites.find(params[:id])

    respond_to do |format|
      if @site.update_attributes(site_params)
        format.html { redirect_to sites_path, notice: t('controllers.action.success.update') }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @site = current_user.sites.find(params[:id])
    @site.destroy
    redirect_to sites_url
  end

  def save_content
    load_site
    p = params[:page] || @page
    @content = @site.contents.where('template_id = ? and page = ? and content_status = ? and target = ?', @site.template.id, p, @status, params[:target]).first

    if @content.present?
      @content.update_attributes(content: params[:content])
    else
      @content = @site.contents.create(template_id: @site.template.id, page: p, content_status: @status, target: params[:target], content: params[:content])
    end

    if @content.errors.blank?
      render :json => @content, :status => :ok
    else
      head :unprocessable_entity # aka 422 status code
    end
  end

  def preview
    load_site
    render "sites/#{@site.template.path}/#{@page}", layout: "sites/#{@site.template.path}"
  end

  def publish
    @site = current_user.sites.find(params[:id])
    @contents = @site.contents.where('template_id = ? and content_status = ?', @site.template.id, :editing)
    @contents.each do |content|
      @site.contents.where('template_id = ? and page = ? and content_status = ? and target = ?', content.template_id, content.page, :published, content.target).destroy_all
      content.update_attribute :content_status, :published
    end
    redirect_to @site, notice: 'Site publicado com sucesso'
  end

  private
  def load_site
    @site = current_user.sites.find(params[:id])
    @page = params[:p] || 'index'
    @status = :editing
  end

  def site_params
    params.require(:site).permit(:template_id)
  end
end

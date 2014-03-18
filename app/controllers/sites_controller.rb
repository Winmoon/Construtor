class SitesController < DashboardController

  skip_before_filter :verify_authenticity_token, :only => [:save_content]

  layout 'edit_site', only: :edit

  def index
    @sites = current_user.sites.paginate(page: params[:page], per_page: 15)
  end

  def show
    @site = current_user.sites.find(params[:id])
  end

  def new
    @site = current_user.sites.new
  end

  def edit
    @site = current_user.sites.find(params[:id])
    @editing = true
    render "sites/#{@site.template.path}/index", layout: "sites/#{@site.template.path}"
  end

  def create

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
    @site = current_user.sites.find(params[:id])
    @content = @site.contents.where('target = ?', params[:target] ).first
    if @content.present?
      @content.update_attributes(content: params[:content])
    else
      @content = @site.contents.create(target: params[:target], content: params[:content])
    end

    if @content.errors.blank?
      render :json => @content, :status => :ok
    else
      head :unprocessable_entity # aka 422 status code
    end
  end

  private
  def site_params
    params.require(:site).permit(:template_id)
  end
end

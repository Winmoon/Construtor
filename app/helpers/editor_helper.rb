module EditorHelper
  def editable_content(id, options = {}, &block)
    p = options[:page] || @page
    if @site.present?
      @content = @site.contents.where('template_id = ? and page = ? and content_status = ? and target = ?', @site.template.id, p, @status, id).first
      @content = @site.contents.where('template_id = ? and page = ? and content_status = ? and target = ?', @site.template.id, p, :published, id).first if @status != :published && @content.blank?
    else
      @content = Content.where('site_id is null and template_id is null and page = ? and content_status = ? and target = ?', p, @status, id).first
      @content = Content.where('site_id is null and template_id is null and page = ? and content_status = ? and target = ?', p, :published, id).first if @status != :published && @content.blank?
    end
    options = options.merge({ contenteditable: 'true', data: { id: id, page: p } }) if @editing
    content_tag((options[:tag] || :div), options.merge({ title: 'Clique para editar' })) do
      if @content.present?
        raw @content.content
      else
        capture(&block)
      end
    end
  end

end

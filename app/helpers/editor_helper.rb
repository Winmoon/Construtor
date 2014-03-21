module EditorHelper
  def editable_content(id, options = {}, &block)
    p = options[:page] || @page
    @content = @site.contents.where('template_id = ? and page = ? and content_status = ? and target = ?', @site.template.id, p, @status, id).first
    @content = @site.contents.where('template_id = ? and page = ? and content_status = ? and target = ?', @site.template.id, p, :published, id).first if @status != :published && @content.blank?
    options = options.merge({ contenteditable: 'true', data: { id: id, page: p } }) if @editing
    content_tag((options[:tag] || :div), options) do
      if @content.present?
        raw @content.content
      else
        capture(&block)
      end
    end
  end
end

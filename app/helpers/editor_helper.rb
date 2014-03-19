module EditorHelper
  def editable_content(id, options = {}, &block)
    @content = @site.contents.where('template_id = ? and page = ? and content_status = ? and target = ?', @site.template.id, @page, @status, id).first
    @content = @site.contents.where('template_id = ? and page = ? and content_status = ? and target = ?', @site.template.id, @page, :published, id).first if @status != :published && @content.blank?
    options = options.merge({ contenteditable: 'true', data: { id: id } }) if @editing
    content_tag(:div, options) do
      if @content.present?
        raw @content.content
      else
        capture(&block)
      end
    end
  end
end

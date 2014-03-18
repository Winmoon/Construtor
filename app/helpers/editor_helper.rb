module EditorHelper
  def editable_content(id, options = {}, &block)
    key = "#{@site.template.path}_#{id}"
    content_tag(:div, options.merge({ contenteditable: 'true', data: { id: key } })) do
      @content = @site.contents.where('target = ?', key).first
      if @content.present?
        raw @content.content
      else
        capture(&block)
      end
    end
  end
end

class Template < ActiveRecord::Base
  belongs_to :template_category

  def to_s
    name
  end
end

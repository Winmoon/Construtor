class Template < ActiveRecord::Base
  belongs_to :template_category
  has_many :sites

  def to_s
    name
  end
end

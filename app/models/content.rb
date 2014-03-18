class Content < ActiveRecord::Base
  belongs_to :site

  validate :site, :target, :content, presence:true

end

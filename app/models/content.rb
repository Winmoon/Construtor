class Content < ActiveRecord::Base
  belongs_to :site

  validate :site, :target, :content, :content_status, presence:true

end

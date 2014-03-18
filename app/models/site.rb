class Site < ActiveRecord::Base
  belongs_to :user
  belongs_to :template

  has_many :contents

  validate :user, :template, presence: true

  after_create :set_name

  def set_name
    name = template.name
  end
end

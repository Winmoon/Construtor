class Site < ActiveRecord::Base
  belongs_to :user
  belongs_to :template

  has_many :contents

  validate :user, :template, presence: true

  before_create :set_name

  def set_name
    self.name = template.name
  end

  def to_s
    name
  end
end

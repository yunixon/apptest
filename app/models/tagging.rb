class Tagging < ActiveRecord::Base
  belongs_to :upload
  belongs_to :tag

  validates_associated :upload
  validates_associated :tag
end

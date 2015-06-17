require 'carrierwave/orm/activerecord'

class Upload < ActiveRecord::Base
  belongs_to :user

  validates_associated :user
  validates :title, :file, presence: true

  mount_uploader :file, FileUploader
end

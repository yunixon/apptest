require 'carrierwave/orm/activerecord'

class Upload < ActiveRecord::Base
  belongs_to :user
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  validates_associated :user
  validates :title, :file, presence: true

  mount_uploader :file, FileUploader

  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).join(', ')
  end
end

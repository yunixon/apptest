class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :uploads, through: :taggings
end

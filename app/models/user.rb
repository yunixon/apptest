class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable
  has_many :uploads, dependent: :destroy
end

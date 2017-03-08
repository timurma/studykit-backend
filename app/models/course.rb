class Course < ApplicationRecord
  mount_uploader :avatar, ::AvatarUploader

  belongs_to :owner, class_name: 'User'
  has_many :lectures

  validates_presence_of :title, :description, :owner
end

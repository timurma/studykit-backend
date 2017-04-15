class Course < ApplicationRecord
  mount_base64_uploader :avatar, AvatarUploader

  belongs_to :owner, class_name: 'User'
  has_many :content, class_name: 'CourseContent'

  validates_presence_of :title, :description, :owner
  validates_integrity_of :avatar
  validates_processing_of :avatar
end

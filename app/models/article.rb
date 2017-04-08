class Article < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  validates_presence_of :title, :body
end

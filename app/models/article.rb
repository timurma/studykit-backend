class Article < ApplicationRecord
  mount_base64_uploader :avatar, AvatarUploader

  validates_presence_of :title, :body
end

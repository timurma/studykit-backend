class VideoContent < ApplicationRecord
  acts_as :course_content

  validates_presence_of :url
end

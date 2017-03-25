class LectureContent < ApplicationRecord
  belongs_to :lecture

  validates_presence_of :type, :title, :lecture, :body, :serial_number
end

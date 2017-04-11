class LectureContent < ApplicationRecord
  actable

  belongs_to :lecture

  validates_presence_of :lecture, :serial_number
end

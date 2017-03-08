class Lecture < ApplicationRecord
  belongs_to :course

  validates_presence_of :title, :course, :serial_number
end

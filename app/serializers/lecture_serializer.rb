class LectureSerializer < ActiveModel::Serializer
  has_many :content

  attributes :id, :title, :serial_number, :course_id
end

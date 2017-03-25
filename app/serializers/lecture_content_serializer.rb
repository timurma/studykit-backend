class LectureContentSerializer < ActiveModel::Serializer
  attributes :id, :type, :title, :lecture_id, :body, :serial_number
end

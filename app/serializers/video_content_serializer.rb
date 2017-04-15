class VideoContentSerializer < ActiveModel::Serializer
  attributes :id, :type, :course_id, :serial_number, :url
end

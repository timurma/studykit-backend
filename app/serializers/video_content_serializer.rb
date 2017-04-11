class VideoContentSerializer < ActiveModel::Serializer
  attributes :id, :type, :lecture_id, :serial_number, :url
end

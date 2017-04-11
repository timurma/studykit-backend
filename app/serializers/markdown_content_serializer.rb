class MarkdownContentSerializer < ActiveModel::Serializer
  attributes :id, :type, :lecture_id, :serial_number, :body, :title
end

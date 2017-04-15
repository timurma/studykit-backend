class MarkdownContentSerializer < ActiveModel::Serializer
  attributes :id, :type, :course_id, :serial_number, :body, :title
end

class LectureSerializer < ActiveModel::Serializer
  attributes :id, :title, :serial_number, :course_id, :content

  def content
    object.content.map(&:specific)
  end
end

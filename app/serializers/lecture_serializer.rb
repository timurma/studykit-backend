class LectureSerializer < ActiveModel::Serializer
  has_many :content

  attributes :id, :title, :serial_number, :course_id

  def content
    collection = object.content.map(&:specific)
    ActiveModel::Serializer::CollectionSerializer.new(collection,
                                                      each_serializer: LectureContentSerializer)
  end
end

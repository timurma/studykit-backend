class CourseSerializer < ActiveModel::Serializer
  belongs_to :owner
  has_many :content

  attributes :id, :title, :description, :avatar, :owner

  def avatar
    "#{instance_options[:host]}#{object.avatar.url}" if object.avatar?
  end

  def content
    collection = object.content.map(&:specific)
    ActiveModel::Serializer::CollectionSerializer.new(collection,
                                                      each_serializer: CourseContentSerializer)
  end
end

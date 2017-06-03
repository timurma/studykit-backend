class CourseSerializer < ActiveModel::Serializer
  belongs_to :owner
  has_many :lectures

  attributes :id, :title, :description, :avatar, :owner, :created_at

  def avatar
    "#{instance_options[:host]}#{object.avatar.url}" if object.avatar?
  end

  def created_at
    object.created_at.to_s(:db)
  end
end

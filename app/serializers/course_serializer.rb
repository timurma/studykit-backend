class CourseSerializer < ActiveModel::Serializer
  belongs_to :owner

  attributes :id, :title, :description, :avatar, :owner
end

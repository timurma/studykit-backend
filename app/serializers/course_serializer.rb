class CourseSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :avatar, :owner
end

class CourseContentSerializer < ActiveModel::Serializer
  def self.serializer_for(model, _options)
    "#{model.class}Serializer".constantize
  end
end

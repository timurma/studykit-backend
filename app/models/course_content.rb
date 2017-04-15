class CourseContent < ApplicationRecord
  actable

  self.inheritance_column = '_type'
  alias_attribute :type, :actable_type

  belongs_to :course

  validates_presence_of :course, :serial_number

  # HACK:
  def self.build_specific(params)
    klass = params[:type].constantize
    klass.new params
  end
end

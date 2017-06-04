class CourseSerializer < BaseCourseSerializer
  belongs_to :owner

  # TODO: remove god-like course object, which includes lectures, lecture_contents and etc.
  attributes :owner, :lectures

  def lectures
    object.lectures.order(:serial_number)
  end
end

class CourseSerializer < BaseCourseSerializer
  belongs_to :owner
  has_many :lectures

  # TODO: remove god-like course object, which includes lectures, lecture_contents and etc.
  def lectures
    object.lectures.order(:serial_number)
  end
end

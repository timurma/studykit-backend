class SqlProblem < ApplicationRecord
  has_many :lecture_content

  validates_presence_of :solution_code, :check_function, :executable
end

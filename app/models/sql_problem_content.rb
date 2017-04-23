class SqlProblemContent < ApplicationRecord
  acts_as :course_content

  has_one :sql_problem

  validates_presence_of :title, :body, :sql_problem
end

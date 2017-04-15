class MarkdownContent < ApplicationRecord
  acts_as :course_content

  validates_presence_of :title, :body
end

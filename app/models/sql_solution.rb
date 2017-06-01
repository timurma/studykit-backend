class SqlSolution < ApplicationRecord
  belongs_to :sql_problem, dependent: :destroy
  belongs_to :user, dependent: :destroy

  validates_presence_of :sql_problem, :user, :code
end

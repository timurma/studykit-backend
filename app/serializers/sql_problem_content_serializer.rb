class SqlProblemContentSerializer < LectureContentSerializer
  attributes :body, :title, :sql_problem_id #, :sql_solutions

  # def sql_solutions
  #   collection = object.sql_solutions
  #   ActiveModel::Serializer::CollectionSerializer.new(collection,
  #                                                     each_serializer: SqlSolutionSerializer)
  # end
end

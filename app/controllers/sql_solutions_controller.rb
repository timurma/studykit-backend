class SqlSolutionsController < ApplicationController
  before_action :authenticate_with_token!, only: %i(show)
  before_action :set_solution, only: [:show]

  def_param_group :sql_solution do
    param :sql_solution, Hash do
      param :sql_problem_id, Integer, required: true, desc: 'id той проблемы, на которую присылается решение'
      param :code, String, required: true
    end
  end

  api!
  example '
  {
    "id": 1,
    "sql_problem_id": 1,
    "user_id": 3,
    "code": "select 1;",
    "succeed": null
  }
  '
  example '
  {
    "id": 1,
    "sql_problem_id": 1,
    "user_id": 3,
    "code": "select 1;",
    "succeed": false
  }
  '
  error code: 404
  def show
    render json: @set_solution
  end

  private

  def set_solution
    @set_solution = current_user.sql_solutions.find params[:id]
  end
end

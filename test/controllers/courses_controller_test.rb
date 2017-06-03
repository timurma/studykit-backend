require 'test_helper'

class CoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user)
    @token = @user.issue_token
    @course = create(:course)
  end

  test 'user should join course' do
    assert_difference('UserGroup.count') do
      post join_course_url(@course), headers: { 'Authorization' => @token }
    end

    assert_response :ok
  end

  test 'user should not join course twice' do
    create(:user_group, user: @user, group: @course.group)

    assert_no_difference('UserGroup.count') do
      post join_course_url(@course), headers: { 'Authorization' => @token }
    end

    assert_response :unprocessable_entity
  end

  test 'should render true for participating user' do
    create(:user_group, user: @user, group: @course.group)

    get participating_course_url(@course), headers: { 'Authorization' => @token }

    assert_response :ok
    assert json_body[:participating] == true
  end

  test 'should render false for not participating user' do
    get participating_course_url(@course), headers: { 'Authorization' => @token }

    assert_response :ok
    assert json_body[:participating] == false
  end
end

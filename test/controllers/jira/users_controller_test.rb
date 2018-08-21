require 'test_helper'

class Jira::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @jira_user = jira_users(:one)
  end

  test "should get index" do
    get jira_users_url
    assert_response :success
  end

  test "should get new" do
    get new_jira_user_url
    assert_response :success
  end

  test "should create jira_user" do
    assert_difference('Jira::User.count') do
      post jira_users_url, params: { jira_user: { password: @jira_user.password, url: @jira_user.url, username: @jira_user.username } }
    end

    assert_redirected_to jira_user_url(Jira::User.last)
  end

  test "should show jira_user" do
    get jira_user_url(@jira_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_jira_user_url(@jira_user)
    assert_response :success
  end

  test "should update jira_user" do
    patch jira_user_url(@jira_user), params: { jira_user: { password: @jira_user.password, url: @jira_user.url, username: @jira_user.username } }
    assert_redirected_to jira_user_url(@jira_user)
  end

  test "should destroy jira_user" do
    assert_difference('Jira::User.count', -1) do
      delete jira_user_url(@jira_user)
    end

    assert_redirected_to jira_users_url
  end
end

require 'test_helper'

class Jira::ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @jira_project = jira_projects(:one)
  end

  test "should get index" do
    get jira_projects_url
    assert_response :success
  end

  test "should get new" do
    get new_jira_project_url
    assert_response :success
  end

  test "should create jira_project" do
    assert_difference('Jira::Project.count') do
      post jira_projects_url, params: { jira_project: {  } }
    end

    assert_redirected_to jira_project_url(Jira::Project.last)
  end

  test "should show jira_project" do
    get jira_project_url(@jira_project)
    assert_response :success
  end

  test "should get edit" do
    get edit_jira_project_url(@jira_project)
    assert_response :success
  end

  test "should update jira_project" do
    patch jira_project_url(@jira_project), params: { jira_project: {  } }
    assert_redirected_to jira_project_url(@jira_project)
  end

  test "should destroy jira_project" do
    assert_difference('Jira::Project.count', -1) do
      delete jira_project_url(@jira_project)
    end

    assert_redirected_to jira_projects_url
  end
end

require 'test_helper'

class Jira::IssuesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @jira_issue = jira_issues(:one)
  end

  test "should get index" do
    get jira_issues_url
    assert_response :success
  end

  test "should get new" do
    get new_jira_issue_url
    assert_response :success
  end

  test "should create jira_issue" do
    assert_difference('Jira::Issue.count') do
      post jira_issues_url, params: { jira_issue: { description: @jira_issue.description, jira_project_id: @jira_issue.jira_project_id, title: @jira_issue.title } }
    end

    assert_redirected_to jira_issue_url(Jira::Issue.last)
  end

  test "should show jira_issue" do
    get jira_issue_url(@jira_issue)
    assert_response :success
  end

  test "should get edit" do
    get edit_jira_issue_url(@jira_issue)
    assert_response :success
  end

  test "should update jira_issue" do
    patch jira_issue_url(@jira_issue), params: { jira_issue: { description: @jira_issue.description, jira_project_id: @jira_issue.jira_project_id, title: @jira_issue.title } }
    assert_redirected_to jira_issue_url(@jira_issue)
  end

  test "should destroy jira_issue" do
    assert_difference('Jira::Issue.count', -1) do
      delete jira_issue_url(@jira_issue)
    end

    assert_redirected_to jira_issues_url
  end
end

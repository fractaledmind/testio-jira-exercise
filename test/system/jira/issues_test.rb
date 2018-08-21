require "application_system_test_case"

class Jira::IssuesTest < ApplicationSystemTestCase
  setup do
    @jira_issue = jira_issues(:one)
  end

  test "visiting the index" do
    visit jira_issues_url
    assert_selector "h1", text: "Jira/Issues"
  end

  test "creating a Issue" do
    visit jira_issues_url
    click_on "New Jira/Issue"

    fill_in "Description", with: @jira_issue.description
    fill_in "Jira Project", with: @jira_issue.jira_project_id
    fill_in "Title", with: @jira_issue.title
    click_on "Create Issue"

    assert_text "Issue was successfully created"
    click_on "Back"
  end

  test "updating a Issue" do
    visit jira_issues_url
    click_on "Edit", match: :first

    fill_in "Description", with: @jira_issue.description
    fill_in "Jira Project", with: @jira_issue.jira_project_id
    fill_in "Title", with: @jira_issue.title
    click_on "Update Issue"

    assert_text "Issue was successfully updated"
    click_on "Back"
  end

  test "destroying a Issue" do
    visit jira_issues_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Issue was successfully destroyed"
  end
end

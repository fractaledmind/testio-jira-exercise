require "application_system_test_case"

class Jira::ProjectsTest < ApplicationSystemTestCase
  setup do
    @jira_project = jira_projects(:one)
  end

  test "visiting the index" do
    visit jira_projects_url
    assert_selector "h1", text: "Jira/Projects"
  end

  test "creating a Project" do
    visit jira_projects_url
    click_on "New Jira/Project"

    click_on "Create Project"

    assert_text "Project was successfully created"
    click_on "Back"
  end

  test "updating a Project" do
    visit jira_projects_url
    click_on "Edit", match: :first

    click_on "Update Project"

    assert_text "Project was successfully updated"
    click_on "Back"
  end

  test "destroying a Project" do
    visit jira_projects_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project was successfully destroyed"
  end
end

class Jira::ProjectsController < ApplicationController
  def index
    @jira_projects = get_and_filter_jira_projects
  end

  private

  def get_and_filter_jira_projects
    jira_response = authenticated_jira_request(method: :get, url: jira_projects_path)
    projects = JSON.parse(jira_response.body)
    return [] if filter_params[:name].blank?

    projects.select { |jp| jp['name'].downcase.include? filter_params[:name].downcase }
  end

  def jira_projects_path
    jira_instance_url + 'rest/api/2/project'
  end
end

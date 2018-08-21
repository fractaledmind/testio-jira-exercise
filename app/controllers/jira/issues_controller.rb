class Jira::IssuesController < ApplicationController
  def new
    @jira_issue = Jira::Issue.new
  end

  def create
    @jira_issue = Jira::Issue.new(jira_issue_params)
    begin
      jira_create_issue_via_api
      redirect_to new_jira_issue_path,
                  notice: 'Issue was successfully created.'
    rescue RestClient::BadRequest => e
      JSON.parse(e.http_body)['errors'].each do |k, m|
        @jira_issue.errors.add(k,
                               message: m)
      end
      render :new
    end
  end

  private

  def jira_create_issue_via_api
    jira_response = authenticated_jira_request(
                      method: :post,
                      url: jira_issue_path,
                      payload: jira_issue_payload,
                      headers: { content_type: :json, accept: :json }
                    )
    JSON.parse(jira_response.body)
  end

  def jira_create_issue_response
    RestClient::Request.execute(
                                user: jira_user.username,
                                password: jira_user.password)
  end

  def jira_issue_payload
    {
      fields: {
        summary: jira_issue_params[:title],
        description: jira_issue_params[:description],
        project: { id: jira_issue_params[:jira_project_id] },
        issuetype: { id: 10000 }
      }
    }.to_json
  end

  def jira_issue_path
    jira_instance_url + 'rest/api/2/issue'
  end

  def jira_issue_params
    params.require(:jira_issue).permit(:title, :description, :jira_project_id)
  end
end

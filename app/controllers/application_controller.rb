class ApplicationController < ActionController::Base
  private

  def filter_params
    params.fetch(:filter, {})
  end

  def authenticated_jira_request(method:, url:, **opts)
    RestClient::Request.execute(method: method,
                                url: url,
                                user: jira_user.username,
                                password: jira_user.password,
                                **opts)
  end

  def jira_user
    return @jira_user if defined? @jira_user

    @jira_user = Jira::User.find_by id: params.fetch(:jira_user_id)
  end

  def jira_instance_url
    jira_user.url
  end
end

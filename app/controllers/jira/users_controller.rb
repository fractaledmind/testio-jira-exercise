class Jira::UsersController < ApplicationController
  def new
    @jira_user = Jira::User.new
  end

  def create
    @jira_user = Jira::User.new(jira_user_params)

    if @jira_user.save
      redirect_to jira_projects_path
    else
      render :new
    end
  end

  private

  def jira_user_params
    params.require(:jira_user).permit(:url, :username, :password)
  end
end

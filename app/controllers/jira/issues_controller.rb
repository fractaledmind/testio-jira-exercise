class Jira::IssuesController < ApplicationController
  before_action :set_jira_issue, only: [:show, :edit, :update, :destroy]

  # GET /jira/issues
  def index
    @jira_issues = Jira::Issue.all
  end

  # GET /jira/issues/1
  def show
  end

  # GET /jira/issues/new
  def new
    @jira_issue = Jira::Issue.new
  end

  # GET /jira/issues/1/edit
  def edit
  end

  # POST /jira/issues
  def create
    @jira_issue = Jira::Issue.new(jira_issue_params)

    if @jira_issue.save
      redirect_to @jira_issue, notice: 'Issue was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /jira/issues/1
  def update
    if @jira_issue.update(jira_issue_params)
      redirect_to @jira_issue, notice: 'Issue was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /jira/issues/1
  def destroy
    @jira_issue.destroy
    redirect_to jira_issues_url, notice: 'Issue was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jira_issue
      @jira_issue = Jira::Issue.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def jira_issue_params
      params.require(:jira_issue).permit(:title, :description, :jira_project_id)
    end
end

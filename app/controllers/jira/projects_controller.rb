class Jira::ProjectsController < ApplicationController
  before_action :set_jira_project, only: [:show, :edit, :update, :destroy]

  # GET /jira/projects
  def index
    @jira_projects = Jira::Project.all
  end

  # GET /jira/projects/1
  def show
  end

  # GET /jira/projects/new
  def new
    @jira_project = Jira::Project.new
  end

  # GET /jira/projects/1/edit
  def edit
  end

  # POST /jira/projects
  def create
    @jira_project = Jira::Project.new(jira_project_params)

    if @jira_project.save
      redirect_to @jira_project, notice: 'Project was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /jira/projects/1
  def update
    if @jira_project.update(jira_project_params)
      redirect_to @jira_project, notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /jira/projects/1
  def destroy
    @jira_project.destroy
    redirect_to jira_projects_url, notice: 'Project was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jira_project
      @jira_project = Jira::Project.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def jira_project_params
      params.fetch(:jira_project, {})
    end
end

class ProjectsController < ApplicationController
  skip_before_action :authorized
  before_action :found_project, only: [:show,:update,:destroy]

  def index
    @projects = Project.all
    render json: @projects, status: 200
  end

  def create
    project = Project.create(project_params)
    render json: project, status: 201
  end

  def update
    @project.update(project_params)
    render json: @project, status: 200
  end

  def destroy
    projectId = @project.id
    @project.destroy
    render json: {message:"Project Removed", projectId:projectId}
  end

  def show
    render json: @project, status: 200
  end

  private
  def project_params
    params.permit(:title, :story, :image_url)
  end

  def found_project
    @project = Project.find(params[:id])
  end


end

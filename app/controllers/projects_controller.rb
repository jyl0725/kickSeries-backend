class ProjectsController < ApplicationController
  skip_before_action :authorized
  before_action :found_project, only: [:show,:update,:destroy]

  def index
    @projects = Project.all
    render json: @projects, status: 200
  end

  def create
    @project = Project.create(project_params)
    if @project.valid?
    render json: @project, status: 201
    else
      render json: { error: 'A Project of the same title already exist and/or Project title can not be blank' }, status: :not_acceptable
    end
  end

  def update
    @project.update(project_params)
    ActionCable.server.broadcast('my_feed', @project)
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

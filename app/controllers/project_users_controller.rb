class ProjectUsersController < ApplicationController
  before_action

  def index
    @project_users = ProjectUser.all
    render json: @project_users, status: 200
  end

  def create
    @project_user = ProjectUser.create(project_user_params)
    render json: @project_user, status: 201
  end

  def update
   @project_user.update(project_user_params)
   render json: @project_user, status: 200
 end

 def destroy
   project_userId = @project_user.id
   @project_user.destroy
   render json: {message:"project_user gone", project_userId:project_userId}
 end

 def show
   render json: @project_user, status: 200
 end

  private

  def project_user_params
    params.permit(:project_id, :user_id, :title)
  end

  def set_project_user
    @project_user = ProjectUser.find(params[:id])
  end
end

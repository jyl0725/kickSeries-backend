class UsersController < ApplicationController
  before_action :found_user, only: [:show,:update,:destroy]

  def index
    @users = User.all
    render json: @users, status: 200
  end

  def create
    user = User.create(Project_params)
    render json: user, status: 201
  end

  def update
    @user.update(note_params)
    render json: @user, status: 200
  end

  def destroy
    userId = @user.id
    @user.destroy
    render json: {message:"User Removed", userId:userId}
  end

  def show
    render json: @user, status: 200
  end

  private
  def user_params
    params.permit(:name, :username, :password, :role)
  end

  def found_user
    @user = User.find(params[:id])
  end


end

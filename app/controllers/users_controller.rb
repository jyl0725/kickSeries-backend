class UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]
  before_action :found_user, only: [:show,:update,:destroy]

  def index
    @users = User.all
    render json: @users, status: 200
  end

  def create
    @user = User.create(user_params)
      if @user.valid?
       render json: @users
       else
         render json: { error: 'Username is taken' }, status: :not_acceptable
      end
  end

  def update
    @user.update(user_params)
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

  # def login_params


  def found_user
    @user = User.find(params[:id])
  end
end

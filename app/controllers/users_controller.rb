class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user
    else
      render json: @user.errors.full_messages
    end
  end

  def new
    @user = User.new
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :email)
  end
end

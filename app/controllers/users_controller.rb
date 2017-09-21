class UsersController < ApplicationController
  before_action :require_current_user!, except: [:create, :new]

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    if current_user == @user
      render json: @user
    else
      render json: "Unable to view other users"
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login!(@user)
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

class UsersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @user = current_user
    @tweets = current_user.tweets
  end

  def show
    @user = User.find_by(tag_name: params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:description, :image)
  end
end

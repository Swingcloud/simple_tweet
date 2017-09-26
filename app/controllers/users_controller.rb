class UsersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @user = current_user
    @tweets = current_user.tweets
  end

  def show
    @user = User.find_by(tag_name: params[:id])
  end
end

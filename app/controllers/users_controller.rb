class UsersController < ApplicationController
  before_action :authenicate_user!, except: :index

  def index
    @user = current_user
    @tweets = current_user.tweets
  end
end

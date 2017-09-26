class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin

  def index
    @tweets = Tweet.all
    @users = User.all
  end
end

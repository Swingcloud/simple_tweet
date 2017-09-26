class TweetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tweets = Tweet.all.order('created_at DESC')
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    if @tweet.save
      redirect_to :root
    else
      render :new
    end
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(tweet_params)
      redirect_to :root
    else
      render :edit
    end
  end

  def like
    @tweet = Tweet.find(params[:id])
    @user = current_user
    @like_tweet = @user.likes.find_by(tweet_id: @tweet.id)
    byebug
    if @like_tweet
      @like_tweet.destroy
      redirect_to tweets_path
    else
      @user.likes.create(tweet_id: @tweet.id)
      redirect_to tweets_path
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:description, :image, :remove_image)
  end
end

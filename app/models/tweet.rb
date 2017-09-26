class Tweet < ApplicationRecord
  has_many :likes, foreign_key: 'tweet_id'
  has_many :liked_users, through: :likes, source: :user
  belongs_to :user

  mount_uploader :image, TweetImageUploader
end

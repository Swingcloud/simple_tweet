class Tweet < ApplicationRecord
  has_many :liked_users, class_name: 'Like', foreign_key: 'user_id'
  belongs_to :user

  mount_uploader :image, TweetImageUploader
end

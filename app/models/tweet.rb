class Tweet < ApplicationRecord
  has_many :liked_users, class_name: 'Like', foreign_key: 'user_id'
  belongs_to :user

  validates :follower_id, presence: true
end

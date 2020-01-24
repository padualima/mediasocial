class User < ApplicationRecord
  has_many :account_users
  has_many :list_users
  has_many :posts

  validates :name, :username, :image_user, presence: true
  has_one_attached :image_user
end

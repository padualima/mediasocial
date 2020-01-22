class User < ApplicationRecord
  has_many :account_users
  has_many :list_users
  has_many :posts

  has_one_attached :image_user
end

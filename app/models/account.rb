class Account < ApplicationRecord
  has_many :account_users
  has_many :posts
  validates :description, presence: true
end

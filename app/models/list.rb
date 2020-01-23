class List < ApplicationRecord
  has_many :list_users
  has_many :posts
end

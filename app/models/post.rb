class Post < ApplicationRecord
  belongs_to :user
  belongs_to :list_user
  belongs_to :account_user
end

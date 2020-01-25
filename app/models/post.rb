class Post < ApplicationRecord
  include PgSearch::Model
  belongs_to :user
  belongs_to :list
  belongs_to :account

  validates :body, :link_social, presence: true
  has_one_attached :image

  def small_photo
    return self.user.image_user.variant(resize: '48x48!').processed
  end

  scope :created_between, lambda {|start_date, end_date| where("created_at >= ? AND created_at <= ?", start_date, end_date )}
  pg_search_scope :search_account, against: %i[account_id]
  pg_search_scope :search, against: %i[body]
  pg_search_scope :search_lists, against: %i[list_id]

end

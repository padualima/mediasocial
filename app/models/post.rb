class Post < ApplicationRecord
  belongs_to :user
  belongs_to :list_user
  belongs_to :account_user
  has_one_attached :image

  def small_photo
    return self.user.image_user.variant(resize: '48x48!').processed
  end

end

class AddLinkSocialToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :link_social, :string
  end
end

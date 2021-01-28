class AddNicknameToFavResources < ActiveRecord::Migration[5.2]
  def change
    add_column :fav_resources, :nickname, :string
  end
end

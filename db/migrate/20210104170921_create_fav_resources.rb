class CreateFavResources < ActiveRecord::Migration[5.2]
  def change
    create_table :fav_resources do |t|
      t.integer :user_id
      t.integer :resource_id
      t.timestamps
    end
  end
end

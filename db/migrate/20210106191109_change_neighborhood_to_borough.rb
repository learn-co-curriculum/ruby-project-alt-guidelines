class ChangeNeighborhoodToBorough < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :neighborhood, :borough
  end
end

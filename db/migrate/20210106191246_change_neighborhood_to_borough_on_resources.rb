class ChangeNeighborhoodToBoroughOnResources < ActiveRecord::Migration[5.2]
  def change
    rename_column :resources, :neighborhood, :borough
  end
end

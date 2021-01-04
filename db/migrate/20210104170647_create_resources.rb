class CreateResources < ActiveRecord::Migration[5.2]
  def change
    create_table :resources do |t|
      t.string :name
      t.string :neighborhood
      t.string :description
      t.boolean :fresh
      t.timestamps
    end
  end
end

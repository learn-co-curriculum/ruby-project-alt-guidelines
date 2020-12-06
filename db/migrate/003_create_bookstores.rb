class CreateBookstores < ActiveRecord::Migration[5.2]
  def change
    create_table :book_stores do |t|
      t.string :name
      t.string :location
      t.string :opening_time
      t.string :closing_time
      
    end
  end
end

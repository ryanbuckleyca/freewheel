class CreateBikes < ActiveRecord::Migration[6.0]
  def change
    create_table :bikes do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :frame_size
      t.integer :seat_count
      t.string :type
      t.integer :year
      t.string :brand
      t.integer :price
      t.string :location
      t.boolean :available_for_rent

      t.timestamps
    end
  end
end

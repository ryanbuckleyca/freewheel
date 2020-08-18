class CreateRentals < ActiveRecord::Migration[6.0]
  def change
    create_table :rentals do |t|
      t.references :user, null: false, foreign_key: true
      t.references :bike, null: false, foreign_key: true
      t.datetime :rental_start
      t.datetime :rental_end
      t.boolean :booking_confirmed
      t.boolean :bike_returned
      t.text :message

      t.timestamps
    end
  end
end

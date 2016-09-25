class CreateBookinghistories < ActiveRecord::Migration[5.0]
  def change
    create_table :bookinghistories do |t|

      t.integer :user_id
      t.string :user_name
      t.integer :room_no
      t.string :building
      t.integer :size
      t.datetime :booking_time
      t.datetime :release_time

      t.timestamps
    end
  end
end

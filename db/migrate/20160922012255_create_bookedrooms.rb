class CreateBookedrooms < ActiveRecord::Migration[5.0]
  def change
    create_table :bookedrooms do |t|
      t.string :status
      t.belongs_to :user, index: true
      t.belongs_to :room, index: true
      t.datetime :booking_time
      t.timestamps
    end
  end
end

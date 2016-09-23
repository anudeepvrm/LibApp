class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.integer :size
      t.string :building
      t.string :room_num

      t.timestamps
    end
  end
end

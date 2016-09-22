class CreateBookedrooms < ActiveRecord::Migration[5.0]
  def change
    create_table :bookedrooms do |t|
      t.integer :roomno
      t.string :building
      t.integer :size
      t.string :status
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end

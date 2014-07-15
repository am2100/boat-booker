class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :name
      t.time :from
      t.time :to

      t.timestamps
    end
  end
end

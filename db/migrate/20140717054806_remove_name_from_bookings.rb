class RemoveNameFromBookings < ActiveRecord::Migration
  def up
    remove_column :bookings, :name
  end

  def down
    add_column :bookings, :name, :string
  end
end

class ChangeDateFormatInBooking < ActiveRecord::Migration
  def change
    change_column :bookings, :book_from, :datetime
    change_column :bookings, :book_to,   :datetime
  end
end

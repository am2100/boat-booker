class FixBookingColumnNames < ActiveRecord::Migration
  def change
    change_table :bookings do |t|
      t.rename :from, :book_from
      t.rename :to,   :book_to
    end
  end
end

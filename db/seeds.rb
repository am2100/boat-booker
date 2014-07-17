
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
today = Date.today.to_time
bookings_array = [{from: '6:00', to: '12:30'},{from: '12:30', to: '14:00'}]

bookings_array.each do |booking|
  from = Time.parse(booking[:from], today)
  to   = Time.parse(booking[:to], today)
  Booking.create!(from: from, to: to)
end

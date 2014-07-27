
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

jims_bookings_array = [{from: 6, to: 12},{from: 12, to: 14}]

users_array = [{name: "Jim", password: "banana"}, {name: "Jacqui", password: "banana"}]

users_array.each do |user|
  User.create!(name: user[:name], password: user[:password])
end

jims_bookings_array.each do |booking|
  user = User.find_by_name("Jim")
  from = DateTime.new(2014,7,23,booking[:from])
  to   = DateTime.new(2014,7,23,booking[:to])
  user.bookings <<  Booking.create!(book_from: from, book_to: to)
end

require 'time'
require 'date'

Given(/^the following bookings exist:$/) do |bookings|
  bookings.hashes.each do |hash|
    date_array = hash['date'].split('/').reverse.collect {|d| d.to_i}
    from_array = hash['from'].split(':').collect {|f| f.to_i}
    to_array   = hash['to'].split(':').collect {|t| t.to_i}

    from = DateTime.new(date_array[0],date_array[1], date_array[2], from_array[0])
    to   = DateTime.new(date_array[0],date_array[1], date_array[2], to_array[0])

    Booking.create!(book_from: from, book_to: to)
  end
end

Given(/^the following bookings exist for today:$/) do |bookings|
  today = Time.now
  bookings.hashes.each do |h|
    from_array = h['From'].split(':')
    to_array   = h['To'].split(':')
    from = Time.utc(today.year, today.month, today.day, from_array[0], from_array[1])
    to   = Time.utc(today.year, today.month, today.day, to_array[0], to_array[1])
    Booking.create!(book_from: from, book_to: to)
  end
end

Then(/^I should see Bookings$/) do
  expect(page).to have_content('Bookings')
end

Then(/^I should see today's date$/) do
  today = Time.now
  date = today.strftime("%d/%m/%Y")
  expect(page).to have_content(date)
end

Then(/^the bookings list should include:$/) do |expected_table|
  rows = find("table#bookings").all('tr')
  table = rows.map { |r| r.all('th,td').map { |c| c.text.strip } }
  expected_table.diff!(table)
end

Then(/^I select (\d+):(\d+) from the "([^"]*)" dropdown menu$/) do | hr, min, menu_name |
  select(hr,  from: "booking_book_#{menu_name.downcase}_4i")
  select(min, from: "booking_book_#{menu_name.downcase}_5i")
end

Then(/^I should see the flash\[:notice\] "(.*?)"$/) do |msg|
  expect(page).to have_content(msg)
end

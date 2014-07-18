require 'time'

Given(/^the following bookings exist for today:$/) do |bookings|
  today = Time.now
  bookings.hashes.each do |h|
    from_array = h['From'].split(':')
    to_array   = h['To'].split(':')
    from = Time.utc(today.year, today.month, today.day, from_array[0], from_array[1])
    to   = Time.utc(today.year, today.month, today.day, to_array[0], to_array[1])
    Booking.create!(from: from, to: to)
  end
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

Then(/^I select (\d+):(\d+) from the 'From' dropdown menu$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

Then(/^I select (\d+):(\d+) from the 'To' dropdown menu$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

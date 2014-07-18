require 'date'
require 'time'

Given(/^the following bookings exist for today:$/) do |bookings|
  today = Date.today.to_time
  p bookings.raw
  bookings.hashes.each do |h|
    from = Time.parse(h[:from], today)
    to   = Time.parse(h[:to]  , today)
    p from
    p to
    Booking.create!(from: from, to: to)
  end
end

Then(/^I should see today's date$/) do
  date = Date.today
  expect(page).to have_content(date)
end

Then(/^the bookings list should include:$/) do |expected_table|
  # table is a Cucumber::Ast::Table
#p expected_table.raw
# save_and_open_page
  rows = find("table#bookings").all('tr')
#p rows
  table = rows.map { |r| r.all('th,td').map { |c| c.text.strip } }
p table
  expected_table.diff!(table)

end

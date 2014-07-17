require 'date'
require 'time'

Given(/^the following bookings exist for today:$/) do |bookings|
  today = Date.today.to_time
  bookings.hashes.each do |h|
    from = Time.parse(h[:from], today)
    to   = Time.parse(h[:to]  , today)
    Booking.create!(from: from, to: to)
  end
end

Then(/^I should see today's date$/) do
  date = Date.today
  expect(page).to have_content(date)
end

Then(/^the bookings list should include:$/) do |table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end

require 'date'

Given(/^the following bookings exist:$/) do |bookings|
  # table is a Cucumber::Ast::Table
  bookings.hashes.each do |h|
    from = Time.new(2014, 7, 17, h[:from])
    to   = Time.new(2014, 7, 17, h[:to])
    Booking.create!(from: from, to: to)
  end
#  Booking.create!(bookings.hashes)
end

Then(/^I should see today's date$/) do
  date = Date.today
  expect(page).to have_content(date)
end

Then(/^the bookings list should include:$/) do |table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end

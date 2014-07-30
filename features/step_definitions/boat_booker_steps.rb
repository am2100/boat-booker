Then(/^I fill in the new booking form with "(.*?)", "(.*?)" and "(.*?)"$/) do |book_from, book_to, date|
  date_array = date.split('/')
  month_hash = { '03' => 'Mar', '04' => 'Apr', '05' => 'May', '06' => 'Jun', '07' => 'Jul', '08' => 'Aug', '09' => 'Sept', '10' => 'Oct' }

  select(date_array[0], from: 'date_day')
  select(month_hash[date_array[1]], from: 'date_month')
  select(book_from, from: 'book_from')
  select(book_to,   from: 'book_to')
end

Given(/^the following bookings exist:$/) do |bookings|
  bookings.hashes.each do |hash|
    user = User.new(name: hash['user'], password: 'banana').valid? ? 
      User.create!(name: hash['user'], password: 'banana') : 
      User.find_by_name(hash['user'])

    date_array = hash['date'].split('/').reverse.collect {|d| d.to_i}
    from_array = hash['from'].split(':').collect {|f| f.to_i}
    to_array   = hash['to'].split(':').collect {|t| t.to_i}

    from = DateTime.new(date_array[0],date_array[1], date_array[2], from_array[0])
    to   = DateTime.new(date_array[0],date_array[1], date_array[2], to_array[0])

    booking = Booking.create!(book_from: from, book_to: to)

    user.bookings << booking
  end
end

Given(/^a valid user called "(.*?)" exists$/) do |arg1|
  FactoryGirl.create(:jim)
end

Given(/^I (?:log|am logged) in as "([^"]*)"$/) do |user|
  click_link 'Log in'
  expect(current_path).to eq(login_path)
  fill_in 'name', with: user
  fill_in 'password', with: 'banana'
  click_button 'Log in'
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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "Bob"
    password "banana"

    factory :user_with_bookings do
      name 'Alice'
      password 'banana'

      # user_with_bookings will create booking data after the user has been created
      transient do
        bookings_count 5
      end

      # the after(:create) yields two values; the user instance itself and the
      # evaluator, which stores all values from the factory, including transient
      # attributes; `create_list`'s second argument is the number of records
      # to create and we make sure the user is associated properly to the booking
      after(:create) do |user, evaluator|
        create_list(:booking, evaluator.bookings_count, user: user)
      end
    end

    factory :invalid_user do
      name nil
    end

    factory :invalid_password_user do
      password nil
    end

    factory :jim do
      name 'Jim'
      password 'banana'
    end
  end
end

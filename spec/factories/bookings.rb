FactoryGirl.define do
  factory :booking do
    book_from DateTime.new(2014, 07, 01, 10, 0)
    book_to   DateTime.new(2014, 07, 01, 11, 0)

    factory :booking_update do
      book_from DateTime.new(2014, 07, 01, 11, 0)
      book_to   DateTime.new(2014, 07, 01, 12, 0)
    end

    factory :invalid_booking do
      book_from nil
      book_to   nil
    end

    factory :invalid_to_booking do
      book_from DateTime.new(2014, 7, 1, 10, 0)
      book_to   nil
    end

    factory :invalid_from_booking do
      book_from DateTime.new(2014, 7, 1, 10, 0)
      book_to   nil
    end
  end
end

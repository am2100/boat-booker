FactoryGirl.define do
  factory :booking do
    book_from Time.utc(2014, 07, 01, 10, 0)
    book_to   Time.utc(2014, 07, 01, 11, 0)

    factory :invalid_booking do
      book_from nil
      book_to   nil
    end

    factory :invalid_to_booking do
      book_from Time.utc(2014, 7, 1, 10, 0)
      book_to   nil
    end

    factory :invalid_from_booking do
      book_from Time.utc(2014, 7, 1, 10, 0)
      book_to   nil
    end
  end
end

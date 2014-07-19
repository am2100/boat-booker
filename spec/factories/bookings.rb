FactoryGirl.define do
  factory :booking do
    from Time.utc(2014, 07, 01, 10, 0)
    to   Time.utc(2014, 07, 01, 11, 0)

    factory :invalid_booking do
      from Time.utc(2014, 7, 1, 10, 0)
      to   nil
    end
  end
end

FactoryGirl.define do
  factory :booking do
    from Time.utc(2014, 07, 01, 10, 0)
    to   Time.utc(2014, 07, 01, 11, 0)
  end
end

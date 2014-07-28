# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "Bob"
    password "banana"

    factory :invalid_user do
      name nil
    end

    factory :invalid_password_user do
      password nil
    end
  end
end

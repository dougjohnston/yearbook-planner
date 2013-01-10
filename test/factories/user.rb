FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "person#{n}@example.com" }
    first_name "Harry"
    last_name "Truman"
    password "password"
    password_confirmation "password"
  end
end

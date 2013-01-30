FactoryGirl.define do
  factory :spread do
    association :section
    association :deadline
    title "9th Grade"
    split false
  end
end

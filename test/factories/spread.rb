FactoryGirl.define do
  factory :spread do
    association :section
    title "9th Grade"
    split false

    factory :spread_with_deadline do
      association :deadline
    end
  end
end

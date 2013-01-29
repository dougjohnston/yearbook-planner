FactoryGirl.define do
  factory :spread do
    association :section
    association :deadline
  end
end

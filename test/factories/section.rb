FactoryGirl.define do
  factory :section do
    association :yearbook, factory: :random_yearbook
  end
end

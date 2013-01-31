FactoryGirl.define do
  factory :deadline do
    association :yearbook
    title "Deadline #1"
    description "Our final deadline"
    due_date { Time.now }
  end
end

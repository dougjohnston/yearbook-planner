FactoryGirl.define do
  factory :deadline do
    association :yearbook
    title "Send to Printer"
    description "Our final deadline"
    due_date { Time.now }
  end
end

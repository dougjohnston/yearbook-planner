FactoryGirl.define do
  factory :page do
    association :spread
    association :deadline
    title "JV Boys Basketball"
  end
end

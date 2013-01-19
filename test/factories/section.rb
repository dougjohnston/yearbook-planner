FactoryGirl.define do
  factory :section do
    association :yearbook, factory: :yearbook
    title 'Elementary'
    pages 0

    factory :section_with_old_yearbook do
      association :yearbook, factory: :old_yearbook
    end
  end
end

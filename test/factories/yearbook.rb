FactoryGirl.define do
  factory :yearbook do
    association :school
    current :false
    starting_year { Time.now.year - 1 }
    ending_year { Time.now.year }
    title "Survivors"
    theme "Survivors"

    factory :old_yearbook do
      starting_year { Time.now.year - 2 }
      ending_year { Time.now.year - 1 }
    end
  end
end

FactoryGirl.define do
  factory :yearbook do
    association :school
    current :false
    starting_year { Time.now.year }
    ending_year { Time.now.year + 1 }
    title "Survivors"
    theme "Survivors"

    factory :old_yearbook do
      starting_year { Time.now.year - 1 }
      ending_year { Time.now.year }
    end

  end
end

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

    factory :random_yearbook do
      sequence(:starting_year) {|n| Time.now.year + n }
      #starting_year { Time.now.year + rand(10) }
      ending_year { starting_year + 1 }
    end
  end
end

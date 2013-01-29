FactoryGirl.define do
  factory :school do
    name "Alliance Academy International"
    short_name "AAI"
    subdomain "aai"
    city "Quito"
    country "Ecuador"

    factory :other_school do
      name "Rancho Bernardo High School"
      short_name "RBHS"
      subdomain "rbhs"
      city "San Diego"
      country "United States"
    end

    factory :school_with_yearbooks do
      #ignore do
        #yearbooks_count 2
      #end

      after(:create) do |school, evaluator|
        FactoryGirl.create(:yearbook, school: school)
        FactoryGirl.create(:old_yearbook, school: school)
      end
    end
  end
end

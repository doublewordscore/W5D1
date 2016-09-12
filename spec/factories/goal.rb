
FactoryGirl.define do
  factory :activity do
    name { Faker::Space.agency }
    user_id 1
  end
end

FactoryGirl.define do
  factory :victim do
    name { Faker::Name.name }
    age { rand(0..120) }
    country { Faker::Address.country }
    city { Faker::Address.city }
    link { Faker::Internet.url }
    info { Faker::Lorem.sentence(5, true, 2) }
  end
end

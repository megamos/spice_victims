FactoryGirl.define do
  factory :link do
    topic { Faker::App.name }
    info { Faker::Lorem.sentence(4, true, 2) }
    url { Faker::Internet.url }
  end
end

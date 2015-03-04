task :fake => :environment do
  30.times do
    Victim.create(name: Faker::Name.name,
                  country: Faker::Address.country,
                  city: Faker::Address.city,
                  link: Faker::Internet.url,
                  age: rand(0..120))
  end

  10.times do
    Link.create(topic: Faker::Commerce.product_name,
                info: Faker::Company.catch_phrase,
                url: Faker::Internet.url)
  end
end

task :fake => :environment do
  puts 'Generating victims...'
  30.times do
    Victim.create(name: Faker::Name.name,
                  country: Faker::Address.country,
                  city: Faker::Address.city,
                  link: Faker::Internet.url,
                  category: ['deceased' ,'hospitalized'].sample,
                  age: rand(0..120))
  end

  puts 'Generating links...'

  10.times do
    Link.create(topic: Faker::Commerce.product_name,
                info: Faker::Company.catch_phrase,
                url: Faker::Internet.url,
                category: ['video', 'newspaper', 'research'].sample)
  end

  puts 'done!'
end

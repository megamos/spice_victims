task :fake => :environment do

  end_of_last_year = [Date.today.year - 1, 12, 31].join('-')
  puts "Generating victims for #{Rails.env}"
  12000.times do
    Victim.create(name: Faker::Name.name,
                  country: Faker::Address.country,
                  city: Faker::Address.city,
                  link: Faker::Internet.url,
                  category: ['deceased' ,'hospitalized','hospitalized','hospitalized','hospitalized','hospitalized'].sample,
                  age: rand(0..90),
                  accident_date: Faker::Date.between( '2004-01-01', end_of_last_year ))
  end

  puts 'Generating links...'

  490.times do
    Link.create(topic: Faker::Commerce.product_name,
                info: Faker::Company.catch_phrase,
                url: Faker::Internet.url,
                category: ['video', 'newspaper', 'research'].sample)
  end

  puts 'done!'
end

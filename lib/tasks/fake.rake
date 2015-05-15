task :fake => :environment do
  puts "Generating victims for #{Rails.env}"
  # 12000.times do
  #   Victim.create(name: Faker::Name.name,
  #                 country: Faker::Address.country,
  #                 city: Faker::Address.city,
  #                 link: Faker::Internet.url,
  #                 category: ['deceased' ,'hospitalized','hospitalized','hospitalized','hospitalized','hospitalized'].sample,
  #                 age: rand(0..90))
  # end
  #
  # puts 'Generating links...'

  490.times do
    Link.create(topic: Faker::Commerce.product_name,
                info: Faker::Company.catch_phrase,
                url: Faker::Internet.url,
                category: ['video', 'newspaper', 'research'].sample)
  end

  puts 'done!'
end

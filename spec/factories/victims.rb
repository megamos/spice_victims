# == Schema Information
#
# Table name: victims
#
#  id         :integer          not null, primary key
#  name       :string
#  age        :integer
#  country    :string
#  city       :string
#  link       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  info       :text
#  category   :string
#
# Indexes
#
#  index_victims_on_category  (category)
#  index_victims_on_country   (country)
#  index_victims_on_id        (id)
#  index_victims_on_name      (name)
#

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

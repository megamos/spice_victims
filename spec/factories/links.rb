# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  topic      :string(40)
#  info       :text(100)
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :link do
    topic { Faker::App.name }
    info { Faker::Lorem.sentence(4, true, 2) }
    url { Faker::Internet.url }
  end
end

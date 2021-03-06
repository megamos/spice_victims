# == Schema Information
#
# Table name: victims
#
#  id            :integer          not null, primary key
#  name          :string
#  age           :integer
#  country       :string
#  city          :string
#  link          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  info          :text
#  category      :string
#  accident_date :date
#
# Indexes
#
#  index_victims_on_category  (category)
#  index_victims_on_country   (country)
#  index_victims_on_id        (id)
#  index_victims_on_name      (name)
#

class Victim < ActiveRecord::Base
  # default_scope { order('country, name') }

  before_save { self.city = city.gsub(/\S+/, &:capitalize) }

  validates :name, presence: true, length: {minimum: 5, maximum: 100}
  validates :age, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 120 }
  validates :country, presence: true
  validates :city, length: {maximum: 30}
  validates :link, presence: true
  validates :info, length: {maximum: 700}

  self.per_page = 20
end

class Victim < ActiveRecord::Base
  before_save { self.city = city.capitalize}

  validates :name, presence: true, length: {minimum: 5, maximum: 100}
  validates :age, presence: true
  validates :country, presence: true
  validates :city, presence: true, length: {maximum: 30}
  validates :link, presence: true
  validates :info, length: {maximum: 700}
end

class Victim < ActiveRecord::Base
  before_save { self.city = city.capitalize}

  validates :name, presence: true, length: {minimum: 5, maximum: 100}
  validates :age, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 120 }
  validates :country, presence: true
  validates :city, presence: true, length: {maximum: 30}
  validates :link, presence: true
  validates :info, length: {maximum: 700}
end

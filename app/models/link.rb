class Link < ActiveRecord::Base
  before_save {self.url = url.downcase! }
  validates :topic, presence: true, length: {minimum: 3,maximum: 50}
  validates :info, presence: true, length: {minimum: 10,maximum: 150}
  validates :url, presence: true, uniqueness: true
end

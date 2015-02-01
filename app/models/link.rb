class Link < ActiveRecord::Base
  validates :topic, presence: true, length: {maximum: 50}
  validates :info, length: {maximum: 150}
  validates :url, uniqueness: true
end

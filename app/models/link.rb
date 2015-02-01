class Link < ActiveRecord::Base
  validates :topic, presence: true, length: {maximum: 40}
  validates :info, length: {maximum: 100}
  validates :url, uniqueness: true
end

class Link < ActiveRecord::Base
  validates :topic, presence: true, length: {maximum: 40}
  validates :info, length: {maximum: 100}
  validates :link, presence: true
end

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

class Link < ActiveRecord::Base
  before_save { self.url.downcase! }
  validates :topic, presence: true, length: {minimum: 3,maximum: 50}
  validates :info, presence: true, length: {minimum: 10,maximum: 150}
  validates :url, presence: true, uniqueness: true
end

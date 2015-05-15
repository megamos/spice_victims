# == Schema Information
#
# Table name: links
#
#  id                      :integer          not null, primary key
#  topic                   :string(40)
#  info                    :text(100)
#  url                     :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  cached_votes_total      :integer          default(0)
#  cached_votes_score      :integer          default(0)
#  cached_votes_up         :integer          default(0)
#  cached_votes_down       :integer          default(0)
#  cached_weighted_score   :integer          default(0)
#  cached_weighted_total   :integer          default(0)
#  cached_weighted_average :float            default(0.0)
#  category                :string
#  victim_id               :integer
#
# Indexes
#
#  index_links_on_cached_votes_down        (cached_votes_down)
#  index_links_on_cached_votes_score       (cached_votes_score)
#  index_links_on_cached_votes_total       (cached_votes_total)
#  index_links_on_cached_votes_up          (cached_votes_up)
#  index_links_on_cached_weighted_average  (cached_weighted_average)
#  index_links_on_cached_weighted_score    (cached_weighted_score)
#  index_links_on_cached_weighted_total    (cached_weighted_total)
#  index_links_on_category                 (category)
#  index_links_on_victim_id                (victim_id)
#

class Link < ActiveRecord::Base
  acts_as_votable

  default_scope { order('cached_votes_score DESC, id') }

  before_save { self.url.downcase! }

  validates :category, presence: true, inclusion: {in: %w(newspaper research video other)}
  validates :topic, presence: true, length: {minimum: 3,maximum: 50}
  validates :info, length: {maximum: 500}
  validates :url, presence: true, uniqueness: true
end

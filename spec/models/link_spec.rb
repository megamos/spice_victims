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
#  cached_votes_total      :integer          default("0")
#  cached_votes_score      :integer          default("0")
#  cached_votes_up         :integer          default("0")
#  cached_votes_down       :integer          default("0")
#  cached_weighted_score   :integer          default("0")
#  cached_weighted_total   :integer          default("0")
#  cached_weighted_average :float            default("0.0")
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
#

require 'rails_helper'

RSpec.describe Link, type: :model do
  it "has a valid factory" do
    expect(build(:link)).to be_valid
  end

  it { should validate_presence_of(:topic) }
  it { should validate_length_of(:topic).is_at_least(3).is_at_most(50) }
  it { should validate_presence_of(:info) }
  it { should validate_length_of(:info).is_at_least(10).is_at_most(150) }
  it { should validate_presence_of(:url) }
  it { should validate_uniqueness_of(:url) }
end

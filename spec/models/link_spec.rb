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

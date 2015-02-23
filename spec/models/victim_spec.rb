require 'rails_helper'

RSpec.describe Victim, type: :model do
  it "has a valid factory" do
    expect(build(:victim)).to be_valid
  end

  it "capitalizes the city before saving" do
    victim = create(:victim, city: "belgrade")
    expect(victim.city).to eq("Belgrade")
  end

  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_least(5).is_at_most(100) }
  it { should validate_presence_of(:age) }
  it { should validate_numericality_of(:age).only_integer
    .is_greater_than_or_equal_to(0)
    .is_less_than_or_equal_to(120) }
  it { should validate_presence_of(:country) }
  it { should validate_presence_of(:city) }
  it { should validate_length_of(:city).is_at_most(30) }
  it { should validate_presence_of(:link) }
  it { should validate_length_of(:info).is_at_most(700) }
end
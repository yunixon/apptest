require 'rails_helper'

describe Tag do
  it 'has a valid factory' do
    expect(build(:tag)).to be_valid
  end

  describe 'Associations' do
    it { is_expected.to have_many(:uploads).through(:taggings) }
    it { is_expected.to have_many(:uploads) }
  end
end

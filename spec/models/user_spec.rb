require 'rails_helper'

describe User do
  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end

  describe 'Associations' do
    it { is_expected.to have_many(:uploads).dependent(:destroy) }
  end
end

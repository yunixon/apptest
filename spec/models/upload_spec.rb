require 'rails_helper'

describe Upload do
  it 'has a valid factory' do
    expect(build(:upload)).to be_valid
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:file) }
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:user) }
  end
end

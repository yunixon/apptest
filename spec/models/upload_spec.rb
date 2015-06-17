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

  it 'return all tags' do
    upload = create(:upload, all_tags: 'tag1,tag2')
    expect(Tag.count).to eq 2
    expect(upload.all_tags).to eq 'tag1, tag2'
  end
end

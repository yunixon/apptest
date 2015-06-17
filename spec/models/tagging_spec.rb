require 'rails_helper'

describe Tagging do
  describe 'Associations' do
    it { is_expected.to belong_to(:upload) }
    it { is_expected.to belong_to(:tag) }
  end
end

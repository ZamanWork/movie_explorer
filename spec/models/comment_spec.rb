require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { build(:comment) }

  describe 'validations' do
    it { should validate_presence_of(:text) }
  end

  describe 'associations' do
    it { should belong_to(:movie) }
  end
end

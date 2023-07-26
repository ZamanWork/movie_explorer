require 'rails_helper'

RSpec.describe Rating, type: :model do
  subject { build(:rating) }

  describe 'validations' do
    it { should validate_presence_of(:value) }
    it { should validate_numericality_of(:value).only_integer.is_greater_than_or_equal_to(1).is_less_than_or_equal_to(10) }
  end

  describe 'associations' do
    it { should belong_to(:movie) }
  end


end

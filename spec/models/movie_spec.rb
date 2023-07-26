
require 'rails_helper'

RSpec.describe Movie, type: :model do
  subject { build(:movie) }

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_numericality_of(:year).only_integer }
  end

  # Add more tests for associations and custom methods as needed.
end

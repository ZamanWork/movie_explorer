require 'rails_helper'

RSpec.describe Movie, type: :model do
  subject { build(:movie) }

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_numericality_of(:release_year).only_integer }
  end

  describe 'associations' do
    it { should have_many(:ratings).dependent(:destroy) }
    it { should have_many(:comments).dependent(:destroy) }
  end

end

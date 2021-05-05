require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_and_belong_to_many(:categories) }
    it { should have_many(:votes) }
  end
end

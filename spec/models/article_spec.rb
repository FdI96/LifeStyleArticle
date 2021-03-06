require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'associations' do
    it { should belong_to(:author) }
    it { should have_many(:votes) }
  end
end

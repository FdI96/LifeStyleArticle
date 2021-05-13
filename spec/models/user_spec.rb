require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:votes).dependents(:destroy) }
    it { should have_many(:articles).dependents(:destroy) }
  end
end

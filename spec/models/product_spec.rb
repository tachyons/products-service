require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'has valid spec' do
    expect(create(:product)).to be_valid
  end
end

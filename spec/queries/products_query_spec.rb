require 'rails_helper'

RSpec.describe ProductsQuery do
  let(:products) { create_list(:product, 10) }

  it '#paginate' do
    expect(described_class.new.paginate(2, 2)).to match_array(products[2...4])
  end

  it '#search' do
    product = create(:product, name: 'Nirma Washing Powder')
    expect(described_class.new.search('powder')).to match_array([product])
  end
end

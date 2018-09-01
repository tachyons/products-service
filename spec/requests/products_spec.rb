require 'rails_helper'

RSpec.describe 'Products', type: :request do
  describe 'GET /products' do
    let(:user) { User.new(id: 1) }

    it 'List products' do
      get products_path, headers: valid_headers
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET products/:id' do
    let(:user) { User.new(id: 1) }
    let(:product) { create(:product) }

    it 'List product details' do
      get product_path(product), headers: valid_headers

      expect(response).to have_http_status(200)
    end
  end
end

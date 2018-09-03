class ProductsController < ApplicationController
  def show
    product = Product.find(params[:id])
    render json: ProductSerializer.new(product)
  end

  def index
    products = Product.page(params[:page] || 1).per(params[:limit] || 6)
    products = products.where('name ILIKE :query', query: "%#{params[:filter][:query]}%") if params.dig(:filter,:query)
    options = {}
    options[:meta] = { total_pages: products.total_pages, total: Product.count }
    render json: ProductSerializer.new(products, options)
  end
end

class ProductsController < ApplicationController
  def show
    product = Product.find(params[:id])
    render json: ProductSerializer.new(product)
  end

  def index
    products = ProductsQuery.new
                            .paginate(params[:page], params[:limit])
                            .search(params.dig(:filter, :query))
                            .sort(params[:sort])
                            .relation
    options = {}
    options[:meta] = { total_pages: products.total_pages, total: Product.count }
    render json: ProductSerializer.new(products, options)
  end
end

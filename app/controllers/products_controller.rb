class ProductsController < ApplicationController
  def show
    product = Product.find(params[:id])
    render json: ProductSerializer.new(product)
  end

  def index
    products = Product.page(params[:page] || 1).per(params[:per_page] || 50)
    render json: ProductSerializer.new(products)
  end
end

class ProductSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :sold_out, :category, :under_sale, :price, :sale_price, :sale_text
end

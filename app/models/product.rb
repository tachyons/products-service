class Product < ApplicationRecord
  update_index('products#product') { self }
end

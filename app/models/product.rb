class Product < ApplicationRecord
  update_index('productsproduct') { self }
end

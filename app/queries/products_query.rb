class ProductsQuery
  attr_reader :relation
  DEFAULT_ENTRIES_PER_PAGE = 6
  def initialize(relation = Product.all)
    @relation = relation
  end

  def paginate(page = 1, per_page = DEFAULT_ENTRIES_PER_PAGE)
    ProductsQuery.new(relation.page(page).per(per_page))
  end

  def search(query)
    return ProductsQuery.new relation unless query
    ProductsQuery.new relation.where('name ILIKE :query', query: "%#{query}%")
  end

  def sort(field)
    return ProductsQuery.new relation unless field
    ProductsQuery.new relation.order(field)
  end
end

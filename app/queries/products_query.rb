class ProductsQuery
  attr_reader :relation
  DEFAULT_ENTRIES_PER_PAGE = 6
  delegate :to_a, to: :relation
  def initialize(relation = Product.all)
    @relation = relation
  end

  def paginate(page = 1, per_page = DEFAULT_ENTRIES_PER_PAGE)
    ProductsQuery.new(relation.page(page).per(per_page))
  end

  def search(query)
    return ProductsQuery.new relation unless query.present?
    ProductsQuery.new relation.where('name ILIKE :query', query: "%#{query}%")
  end

  def sort(field)
    return ProductsQuery.new relation unless field.present?
    ProductsQuery.new relation.order(field)
  end

  def filter(category)
    return ProductsQuery.new relation unless category.present?
    ProductsQuery.new relation.where(category: category.split(','))
  end
end

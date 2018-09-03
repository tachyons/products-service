class ProductsQuery
  attr_reader :relation
  DEFAULT_ENTRIES_PER_PAGE = 6
  def initialize(relation = Product.all)
    @relation = relation
  end

  def paginate(page = 1, per_page = DEFAULT_ENTRIES_PER_PAGE)
    relation.page(page).per(per_page)
  end

  def search(query)
    return relation unless query
    relation.where('name ILIKE :query', query: "%#{params[:filter][:query]}%")
  end
end

class User
  attr_reader :id, :email, :name
  def initialize(id:, email: nil, name: nil)
    @id = id
    @name = name
    @email = email
  end

  def eql?(other)
    id == other.id
  end
end

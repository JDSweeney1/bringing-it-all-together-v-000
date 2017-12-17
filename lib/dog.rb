class Dog
  attr_accessor :name, :breed, :id

  def initialize(id: nil, name:, breed:)
    @name, @breed, @id = name, breed, id
  end

end

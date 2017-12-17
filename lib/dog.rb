class Dog
  attr_accessor :name, :breed, :id

  def initialize(id: nil, name:, breed:)
    @name, @breed, @id = name, breed, id
  end

  def self.create_table
    sql = <<-SQL
      CREATE TABLE IF NOT EXISTS dogs (
        id INTEGER PRIMARY KEY,
        name TEXT,
        breed TEXT
      )
    SQL

      DB[:conn].execute(sql)
  end

  def self.drop_table
    sql = <<-SQL
      DROP TABLE dogs
    SQL

    DB[:conn].execute(sql)
  end

  # def self.create(name, breed)
  #   dog = Dog.new(name, breed)
  #   dog.save
  #   dog
  # end

  # def self.find_by_id(id)
  #   sql = <<-SQL
  #     SELECT * FROM students
  #     WHERE id = ?
  #   SQL
  #
  #   data = DB[:conn].execute(sql, id)
  #   Dog.new(id: data[0], name: data[1], breed: data[2])
  #   Dog
  # end
  def save
    # if self.idea
    #
    sql = <<-SQL
      INSERT INTO dogs (name, breed) VALUES (?, ?)
    SQL

    DB[:conn].execute(sql, self.name, self.breed)
    self.id = DB[:conn].execute("SELECT last_insert_rowid() FROM dogs")[0][0]
    self
  end
end

require_relative('../db/sql_runner.rb')

class House

  attr_accessor :name, :logo
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @logo = options['logo']
  end

  def save()
    sql = "INSERT INTO houses
    (
      name,
      logo
      )
      VALUES ($1, $2)
      RETURNING id"
    values = [@name, @logo]
    @id = SqlRunner.run(sql, values).first["id"].to_i
  end

  def self.all()
    sql = "SELECT * FROM houses"
    result = SqlRunner.run(sql)
    return result.map { |house| House.new(house)}
  end

  def self.delete_all()
    sql = "DELETE FROM houses"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM houses
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    return House.new(result)
  end

end

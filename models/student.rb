require_relative('../db/sql_runner.rb')

class Student

  attr_reader :id
  attr_accessor :first_name, :last_name, :house, :age

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @house = options['house'].to_i
    @age = options['age'].to_i
  end

  def save()
    sql = "INSERT INTO students
          (first_name,
            last_name,
            house,
            age)
            VALUES($1, $2, $3, $4)
            RETURNING id"
    values = [@first_name, @last_name, @house, @age]
    @id = SqlRunner.run(sql, values).first['id'].to_i
  end

  def house()
    sql = "SELECT * FROM houses
    WHERE id = $1"
    values = [@house]
    result = SqlRunner.run(sql, values).first
    return House.new(result)
  end

  def self.all()
    sql = "SELECT * FROM students"
    result = SqlRunner.run(sql)
    return result.map { |student| Student.new(student) }
  end

  def self.delete_all()
    sql = "DELETE FROM students"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM students
          WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    return Student.new(result)
  end

end

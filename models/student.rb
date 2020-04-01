require_relative('../db/sql_runner.rb')

class Student

  attr_reader :id
  attr_accessor :first_name, :last_name, :age, :house_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @age = options['age'].to_i
    @house_id = options['house_id'].to_i
  end

  def save()
    sql = "INSERT INTO students
           (first_name, last_name, age, house_id)
           VALUES ($1, $2, $3, $4)
           RETURNING *"
    values = [@first_name, @last_name, @age, @house_id]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM students"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM students"
    result = SqlRunner.run(sql)
    self.map_items(result)
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM students
           WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    self.returns_single_student(results)
  end

  def self.find_by_name(first_name, last_name)
    sql = "SELECT * FROM students
           WHERE first_name = $1
           AND last_name = $2"
    values = [first_name, last_name]
    results = SqlRunner.run(sql, values)
    self.returns_single_student(results)
  end

  def self.find_by_age_rage(age1, age2)
    sql = "SELECT * FROM students
           WHERE age >= $1
           AND age <= $2"
    values = [age1, age2]
    results = SqlRunner.run(sql, values)
    self.map_items(results)
  end

  def full_name()
    return "#{@first_name} #{@last_name}"
  end

  def house()
    sql = "SELECT * FROM houses
           WHERE id = $1"
    values = [@house_id]
    results = SqlRunner.run(sql, values)
    House.returns_single_house(results)
  end

  def house_name()
    house = house()
    house.house_name
  end

  def house_logo()
    house = house()
    house.logo
  end

  def self.returns_single_student(results)
    return nil if results.first() == nil
    Student.new(results.first())
  end

  def self.map_items(result)
    result.map{|customer| Student.new(customer)}
  end

end

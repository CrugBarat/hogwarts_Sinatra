require_relative('../db/sql_runner.rb')

class House

  attr_reader :id
  attr_accessor :house_name, :logo

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @house_name = options['house_name']
    @logo = options['logo']
  end

  def save()
    sql = "INSERT INTO houses (house_name, logo)
           VALUES ($1, $2)
           RETURNING *"
    values = [@house_name, @logo]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM houses"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM houses"
    result = SqlRunner.run(sql)
    self.map_items(result)
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM houses
           WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    self.returns_single_house(results)
  end

  def self.returns_single_house(results)
    return nil if results.first() == nil
    House.new(results.first())
  end

  def self.map_items(result)
    result.map{|customer| House.new(customer)}
  end

end

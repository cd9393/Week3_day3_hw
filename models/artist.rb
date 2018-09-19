require("pg")
require_relative("../db/sql_runner")

class Artist
  attr_accessor :name
  attr_reader :id

  def initialize(options)
    @name = options["name"]
    @id = options["id"].to_i if options["id"]
  end

  def save()
    sql = "INSERT INTO artists (name)
    values
    ($1)
    RETURNING *"
    values =[@name]
    results = SqlRunner.run(sql,values)
    @id = results[0]["id"].to_i
  end

  def album()
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    results = SqlRunner.run(sql,values)
    return results.map{|results_hash| Album.new(results_hash)}
  end

  # def update()
  #   sql = "UPDATE artists SET (name) = ($1) WHERE id = $2"
  #   values = [@name, @id]
  #   SqlRunner.run(sql,values)
  # end

  def self.all()
    sql = "SELECT * FROM artists"
    artists = SqlRunner.run(sql)
    return artists.map{|artist_hash|Artist.new(artist_hash)}
  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end
end

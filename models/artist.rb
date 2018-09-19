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

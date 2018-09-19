require("pg")
require_relative("../db/sql_runner")

class Album

  attr_accessor :name, :genre
  attr_reader :id

  def initialize(options)
    @name = options["name"]
    @genre = options["genre"]
    @id = options["id"].to_i if options["id"]
    @artist_id = options["artist_id"].to_i
  end

  def save()
      sql = "INSERT INTO albums (name, genre, artist_id)
      values
      ($1, $2, $3)
      RETURNING *"
      values =[@name, @genre, @artist_id]
      results = SqlRunner.run(sql,values)
      @id = results[0]["id"].to_i
  end


end

require("pry")
require_relative("../models/artist")
require_relative("../models/albums")

Artist.delete_all()

artist1 = Artist.new({"name" => "Elton John"})

artist1.save()

album1 = Album.new({
  "name" => "Tiny Dancer",
  "genre" => "Classic",
  "artist_id" => artist1.id
  })

  album1.save()

binding.pry
nil

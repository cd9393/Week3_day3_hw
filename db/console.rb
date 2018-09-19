require("pry")
require_relative("../models/artist")
require_relative("../models/albums")

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({"name" => "Elton John"})

artist1.save()

album1 = Album.new({
  "name" => "Tiny Dancer",
  "genre" => "Classic",
  "artist_id" => artist1.id
  })

  album1.save()
  artist1.name = "bon jovi"
  artist1.update()

  artist1.albums

binding.pry
nil

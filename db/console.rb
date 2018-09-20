require("pry")
require_relative("../models/artist")
require_relative("../models/albums")

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({"name" => "Elton John"})
artist2 = Artist.new({"name" => "Skepta"})
artist3 = Artist.new({"name" => "Bob Marley"})

artist1.save()
artist2.save()
artist3.save()

album1 = Album.new({
  "name" => "Tiny Dancer",
  "genre" => "Classic",
  "artist_id" => artist1.id
  })

  album2 = Album.new({
    "name" => "Konnichiwa",
    "genre" => "Grime",
    "artist_id" => artist2.id
    })

  album3 = Album.new({
      "name" => "Exodus 40",
      "genre" => "Reggae",
      "artist_id" => artist2.id
      })

  album1.save()
  album2.save()
  album3.save()

  artist1.name = "bon jovi"
  artist1.update()

  artist1.albums

binding.pry
nil

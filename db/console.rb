require("pry")
require_relative("../models/artist")

Artist.delete_all()

artist1 = Artist.new({"name" => "Elton John"})

  artist1.save()

binding.pry
nil

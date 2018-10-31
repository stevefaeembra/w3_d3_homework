require_relative("../models/artists")
require_relative("../models/albums")

artist1 = Artist.new({
		'name' => 'U2'
});

p artist1

album1 = Album.new({
	'title' => "Joshua Tree",
	'genre' => "rock",
	'artist_id' => 1
	})

p album1

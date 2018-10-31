require_relative("../models/artists")
require_relative("../models/albums")
require('pp')

artist1 = Artist.new({
		'name' => 'U2'
});

p artist1

artist1.save()
p Artist.all()

album1 = Album.new({
	'title' => "Joshua Tree",
	'genre' => "rock",
	'artist_id' => artist1.id
	})

p album1
album1.save()
pp Album.all()
pp artist1.albums

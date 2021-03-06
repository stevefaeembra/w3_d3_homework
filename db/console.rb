require_relative("../models/artists")
require_relative("../models/albums")
require('pp')

Album.delete_all()
Artist.delete_all()

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
pp album1.artist

pp Artist.artist_by_id(artist1.id)

pp Album.album_by_id(album1.id)

artist1.name = "Prince"
artist1.update
p Artist.all()
pp Artist.artist_by_id(artist1.id)

album1.genre = "prog-rock"
album1.update
pp Album.album_by_id(album1.id)

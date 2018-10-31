require_relative('../db/sqlrunner')

class Album
	attr_reader :id
	attr_accessor :genre, :title, :artist_id

	def initialize(options)
		@id = options["id"] if options["id"]
		@title = options["title"]
		@genre = options["genre"]
		@artist_id = options["artist_id"]
	end

	def save
		result = SqlRunner.run("INSERT INTO albums (title,genre,artist_id) VALUES ($1,$2,$3) RETURNING *",[@title,@genre,@artist_id])
		@id = result[0]['id']
	end

	def self.all()
		sql = "SELECT * FROM albums"
		SqlRunner.run(sql).map {|p| Album.new(p)}
	end

end

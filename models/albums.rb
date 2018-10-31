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

	def artist()
		sql = "SELECT * FROM artists WHERE id = $1"
		values = [@artist_id]
		Artist.new(SqlRunner.run(sql, values).first)
	end

	def self.delete_all()
		sql = "DELETE FROM albums"
		SqlRunner.run(sql)
	end

	def self.album_by_id(id)
		sql = "SELECT * FROM albums WHERE id = $1"
		values = [id]
		Album.new(SqlRunner.run(sql, values).first)
	end

	def update()
		sql = "UPDATE albums SET (title, genre, artist_id)  = ($1, $2, $3) WHERE id = $4"
		values = [@title, @genre, @artist_id, @id]
		SqlRunner.run(sql, values)
	end

end

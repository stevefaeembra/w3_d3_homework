require_relative('../db/sqlrunner')

class Artist

	attr_reader :id
	attr_accessor :name

	def initialize(options)
		@name = options['name']
		@id = options['id'] if options['id']
	end

	def save()
		sql = "INSERT INTO artists (name) VALUES ($1) RETURNING *"
		values = [@name]
		result = SqlRunner.run(sql, values)
		@id = result[0]["id"]
	end

	def self.all()
		sql = "SELECT * FROM artists"
		result = SqlRunner.run(sql)
		result.map {|p| Album.new(p)}
	end

	def albums()
		# return albums for artist
		sql = "SELECT * FROM albums WHERE artist_id = $1"
		values = [@id]
		result = SqlRunner.run(sql,values)
		result.map {|a| Album.new(a)}
	end

	def self.artist_by_id(id)
		sql = "SELECT * FROM artists WHERE id = $1"
		values = [id]
		Artist.new(SqlRunner.run(sql, values).first)
	end

	def self.delete_all()
		sql = "DELETE FROM artists"
		SqlRunner.run(sql)
	end

	def update()
		sql = "UPDATE artists SET name = $1 WHERE id = $2"
		values = [@name, @id]
		SqlRunner.run(sql, values)
	end

end

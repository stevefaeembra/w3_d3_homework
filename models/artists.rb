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


end

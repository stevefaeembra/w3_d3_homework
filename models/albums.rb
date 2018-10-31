class Album
	attr_reader :id
	attr_accessor :genre, :title, :artist_id

	def initialize(options)
		@id = options["id"] if options["id"]
		@title = options["title"]
		@genre = options["genre"]
		@artist_id = options["artist_id"]
	end

end

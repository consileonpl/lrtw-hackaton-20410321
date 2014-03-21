require_relative '../models/link'

class RetriveShortenedUrl
	def retrive(shortened_url)
		Link.where(hash: shortened_url).first.full_url
	end
end

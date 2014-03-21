require_relative './model/link'

class RetriveShortenedUrl
	def retrive(shortened_url)
		Link.where(hash: shortened_url).first.full_url
	end
end
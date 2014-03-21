require_relative './model/link'

class ShortensUrl
	def shorten(base_url, full_url)
		hash = SecureRandom.urlsafe_base64(3, true)
		shortend_url = "#{base_url}/#{hash}"
		Link.create(full_url: full_url, hash:hash)
		shortend_url
	end
end

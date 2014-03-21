class ShortensUrl
	def shorten(base_url, full_url)
		hash = SecureRandom.urlsafe_base64(16, true)
		shortend_url = "#{base_url}/#{hash}"
	end
end
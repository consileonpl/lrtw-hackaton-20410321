require 'mongoid'

class Link
	include Mongoid::Document
	field :full_url, type: String
	field :hash, type: String
end
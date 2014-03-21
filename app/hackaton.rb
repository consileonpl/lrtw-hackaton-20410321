require 'sinatra'
require_relative './shortens_url'
require_relative './retrive_shortened_url'
require 'sinatra/json'
require 'mongoid'

get '/:short_url' do
	retrive_shortened_url_service = RetriveShortenedUrl.new
	absolute_url = retrive_shortened_url_service.retrive (params[:short_url])
	redirect absolute_url
end

post '/' do
	shortens_url_service = ShortensUrl.new
	shortend_url = shortens_url_service.shorten(request.base_url, params[:url])
	json shortend_url: shortend_url
end
require 'sinatra'
require_relative './shortens_url'
require 'sinatra/json'

get '/' do
  'Hello world!'
end

post '/' do
	shortens_url_service = ShortensUrl.new
	shortend_url = shortens_url_service.shorten(request.base_url, params[:url])
	json shortend_url: shortend_url
end
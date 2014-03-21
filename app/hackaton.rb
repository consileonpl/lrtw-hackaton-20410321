require 'sinatra'
require_relative './shortens_url'
require 'sinatra/json'

get '/' do
  'Hello world!'
end

post '/' do
	shortens_url_service = ShortensUrl.new
	shorten_url = shortens_url_service.shorten(params[:url])
	json shortend_url: shorten_url
end
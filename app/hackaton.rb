require 'sinatra'
require_relative './shortens_url'
require 'sinatra/json'
require 'pry'

get '/' do
  'Hello world!'
end

post '/' do
	binding.pry
	shortens_url_service = ShortensUrl.new
	shorten_url = shortens_url_service.shorten(params[:url])
	{shortend_url: shorten_url} 
end
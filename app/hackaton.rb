require 'sinatra'
require_relative './services/shortens_url'
require_relative './services/retrive_shortened_url'
require 'sinatra/json'
require 'mongoid'

Mongoid.load!("./config/mongoid.yml")

get '/' do
  @shortened_url = params[:short_url]
  erb :index
end

get '/:short_url' do
	retrive_shortened_url_service = RetriveShortenedUrl.new
	absolute_url = retrive_shortened_url_service.retrive (params[:short_url])
	redirect absolute_url
end

post '/' do
	shortens_url_service = ShortensUrl.new
	shortend_url = shortens_url_service.shorten(request.base_url, params[:url])
	#json shortend_url: shortend_url
  redirect to("/?short_url=#{shortend_url}")
end

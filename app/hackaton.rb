require 'sinatra'
require_relative './shortens_url'
require 'sinatra/json'
require 'mongoid'

require_relative './models/link'

Mongoid.load!('config/mongoid.yml')

get '/' do
  @errors = params[:errors]
  @shortened_url = params[:shortened_url]
  erb :index
end

post '/' do
  shortens_url_service = ShortensUrl.new
  shortened_url = shortens_url_service.shorten(params[:url])
  if shortened_url.nil?
    redirect to("/?errors=true")
  else
    redirect to("/?shortened_url=#{shortened_url}")
  end
end

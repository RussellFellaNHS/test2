require 'sinatra'
require './content_resolver'

set :server, 'webrick'


get '/content' do

  @content_resolver = ContentResolver.new()

  #get content from service

  # # cr = ContentResolver.new
  #cr.get_content_assets_by_uri

  #@content_resolver.get_content_assets_by_uri("article/asthma/overview")

  #puts @content_resolver.inspect

  "a"

end

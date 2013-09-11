require 'sinatra'
require './content_resolver'

get '/content' do

  #get content from service

  cr = ContentResolver.new
  cr.get_content_assets_by_uri

end

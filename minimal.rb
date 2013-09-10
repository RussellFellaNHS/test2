require 'sinatra'
require './content_resolver'

# class Mimimal < Sinatra::Base

  get '/' do
    'Mimimal Sinatra Hello'
  end

  get '/russ' do
    'Mimimal Russ Sinatra Hello'
  end

  get '/c' do
    a = ContentTeaser.new('1','title','desc')
    a.title
  end

# end

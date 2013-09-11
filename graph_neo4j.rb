require 'rubygems'
require 'neography'
require 'yajl'
require './content_asset_models'


class Graph

def get_content_assets_by_uri(uri)

  Neography.configure do |config|
    config.protocol       = "http://"
    config.server         = "localhost"
    config.port           = 7474
    config.directory      = ""  # prefix this path with '/' 
    config.cypher_path    = "/cypher"
    config.gremlin_path   = "/ext/GremlinPlugin/graphdb/execute_script"
    config.log_file       = "neography.log"
    config.log_enabled    = false
    config.max_threads    = 20
    config.authentication = nil  # 'basic' or 'digest'
    config.username       = nil
    config.password       = nil
    config.parser         = MultiJsonParser
  end
 
  @neo = Neography::Rest.new


  @nodeid = 0

  if (uri == 'article/asthma/overview')
    @nodeid = 9
  elsif (uri == 'article/asthma/living-with-arthritis')
    @nodeid = 10
  end

  # Cypher queries:

  responce = @neo.execute_query("start n=node(9) match n-[:URI_CONTENT_ASSOC]->m-[:ASSET_ASSOC]->asset  return asset;")

  items = responce["data"].flat_map do |my_array|
    my_array.map{|x|x["data"]}
  end

  #items.each {|x| puts x, " -- "}

  @final_array = []

  items.each do |x|
    puts x["type"]
    
    if x["type"] == "Content_Asset_Article"
      @final_array << ContentEditorial.new(x["id"], x["type"], x["name"])
    elsif x["type"] == "Content_Asset_Teaser"
      @final_array << ContentTeaser.new(x["id"], x["type"], x["name"])
    #elsif x["type"] == "Content_Asset_Video"
    #elsif x["type"] == "Content_Asset_Image"
    end

  end

  @final_array

end

end

# get_content_assets_by_uri('article.asthma/overview')

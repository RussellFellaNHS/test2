require './graph_neo4j'
require './content_asset_models'


class ContentResolver

  def graph
    @graph ||= Graph.new
  end

  def get_content_assets_by_uri(uri)
    a = graph.get_content_assets_by_uri(uri)
  end

end

#a = ContentResolver.new()
#a.get_content_assets_by_uri("article/asthma/overview")

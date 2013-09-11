require 'rubygems'
require 'neography'

def test_method
  "Hello from Test Method"
end

#def suggestions_for(node)
#  @neo.traverse(node,
#                "nodes", 
#                {"order" => "breadth first", 
#                 "uniqueness" => "node global", 
#                 "relationships" => {"type"=> "friends", 
#                                     "direction" => "in"}, 
#                 "return filter" => {"language" => "javascript",
#                                     "body" => "position.length() == 2;"},
#                 "depth" => 2}).map{|n| n["data"]["name"]}.join(', ')
#end

#puts "nn #{suggestion_for(1)}"



class NodeContentConcept do
  
  include Id:Model

  field :id
  field :type
  field :name

end




def test_neo4j
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

  # Cypher queries:
  s = @neo.execute_query("start n=node(1) return n")

  puts s.inspect

  "a"

end

describe "test the test_method" do
  it 'should return something' do
    expect(test_method).to eq "Hello from Test Method"
  end
end

describe "test nero4j" do
  it 'test nero4j' do
    expect(test_neo4j).to eq "a"
  end
end

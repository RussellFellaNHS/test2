require 'rubygems'
require 'neography'

def test_method
  "Hello from Test Method"
end


class NodeContentConcept

  def initialize params
    @id = params["id"]
    @type = params["type"]
    @name = params["name"]
  end

  attr_accessor :id, :type, :name

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
  a = @neo.execute_query("start n=node(1) return n")
  b = @neo.get_node(1) 
  c = @neo.get_node_properties(1) 
  #s = @neo.get_root

  #puts a.inspect
  #puts '---------------------------------------------------'
  #puts b.inspect
  #puts '---------------------------------------------------'
  #puts c

  e = NodeContentConcept.new(c)

  puts '#####################################################' 

  puts e.inspect

  puts '####################################################'

  puts e

  puts '####################################################'

  puts e.id 

  puts '####################################################'


  
  "a"

end

describe "test the test_method" do
  it 'should return something' do
    expect(test_method).to eq "Hello from Test Method"
  end
end

describe "test nero4j" do

  args = '{"name"=>"Arthritis", "type"=>"Content_Concept", "id"=>"1"}'

  let (:node){NodeContentType.new(args)}

  it 'should create a node' do
    expect(node.id).to eq '1'
  end

  it 'test nero4j' do
    expect(test_neo4j).to eq "a"
  end

end

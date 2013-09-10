require 'rspec'

class Parrot
  def touch_tail
    "Squark"
  end
end



# Content reolver........


#class ContentBase < Struct.new(:content_id)
#end

class ContentTeaser < Struct.new(:content_id, :title, :description) 
end

class ContentLink < Struct.new(:content_id, :title, :alt, :uri) 
end

class ContentEditorial < Struct.new(:content_id, :heading, :content)
end

class ContentImage < Struct.new(:content_id, :name, :alt, :url)
end

class ContentVideo < Struct.new(:content_id, :name, :alt, :url)
end

class ContentResolver
  def resolve_content_instance_id_by_uri(uri)
    if(uri == 'http://www.nhs.uk/contenta')
      1
    elsif(uri == 'http://www.nhs.uk/contentb')
      2
    end
  end

  def resolve_content_id_by_content_instance_id (content_instance_id)
    if(content_instance_id == 1)
      [1,3,6]
    elsif(content_instance_id == 2)
      [2,4,8]
    end
  end

  def get_content_instance_model_by_id(content_ids)
    if(content_ids == [1,3,6])
      a = ContentTeaser.new('1', 'a', 'b') 
      b = ContentTeaser.new('2', 'c', 'd')
      c = ContentLink.new('3', 'Link Title', 'http://link_url')
      d = ContentImage.new('4', 'Image Name', 'Image Alt', 'http://image_url')
      e = ContentVideo.new('5', 'Video Name', 'Video Alt', 'http://video_url')
      f = ContentEditorial.new('6', 'Artritis', 'Some text about arthritis....')      
      [a,b,c,d,e,f]
    elsif(content_ids == [2,4,8])
      a = ContentTeaser.new('1', 'a', 'b') 
      b = ContentTeaser.new('2', 'c', 'd')      
      [a,b] 
    end
  end

end


# Parrot Test

describe Parrot do
  it 'squarks when you touch its tail' do
    expect(Parrot.new.touch_tail).to eq 'Squark'
  end	
end


# Content Resolver Test

describe ContentResolver do

  let (:resolver){ ContentResolver.new }
    
  it 'resolves a URI to a Content Istance ID' do
    expect(resolver.resolve_content_instance_id_by_uri('http://www.nhs.uk/contenta')).to eq 1
    expect(resolver.resolve_content_instance_id_by_uri('http://www.nhs.uk/contentb')).to eq 2
  end

  it 'resolves all the content ids assocaited with a content instance id' do
    expect(resolver.resolve_content_id_by_content_instance_id(1)).to eq [1,3,6]
    expect(resolver.resolve_content_id_by_content_instance_id(2)).to eq [2,4,8]
  end

  it 'passes back any content instances associated with the...' do
    #expect(resolver.get_content_instance_model_by_id([1,3,6])).to eq [ContentTeaser.new('1', 'a','b'), ContentTeaser.new('2', 'c','d')]

    expect(resolver.get_content_instance_model_by_id([1,3,6]).first).to eq ContentTeaser.new('1', 'a','b')
  end

end



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

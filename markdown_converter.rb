#require 'rspec'

class MarkdownConverter

  attr_accessor :content
  attr_accessor :markdown_map

  def initialize 

    @markdown_map = {' # ' => '<h1>', ' #### ' => '<h4>'}

  end

  def convert_content content_param
 
      @content = content_param.gsub(" # ", " <h1> ")
      @content = @content.gsub(" #### ", " <h4> ")
      puts @content
      @content

  end

end



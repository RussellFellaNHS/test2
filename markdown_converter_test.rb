require 'rspec'
require './markdown_converter'


describe MarkdownConverter do

  it 'Should replace my mark down with the HTML' do

   expect(MarkdownConverter.new.convert_content(" # Title H1 #### Sub Title H4 ")).to eq " <h1> Title H1 <h4> Sub Title H4 "

  end

end




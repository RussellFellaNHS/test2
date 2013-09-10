require 'capybara'
require 'capybara/cucumber'
require 'rspec'
require File.join(File.dirname(__FILE__), '..', '..', 'minimal.rb')



ENV['RACK_ENV'] = 'test'

Capybara.app = Minimal

class MinimalWorld
  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers
end

World do
  MinimalWorld.new
end

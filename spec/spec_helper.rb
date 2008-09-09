ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../../../../config/environment")
require 'spec'
require 'spec/rails'

Spec::Runner.configure do |config|
  config.fixture_path = "#{File.dirname(__FILE__)}/../spec/fixtures"
end

def add_fixture_views(controller_class)
  controller_class.prepend_view_path(File.join(File.dirname(__FILE__), 'fixtures', 'views'))
end
require 'em-synchrony/em-http'
require 'goliath/test_helper'
require 'yajl/json_gem'
require "rack/test"
require "rspec/autorun"
require 'factory_girl'

require File.absolute_path("../../config/environment.rb", __FILE__)

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[RufinoApi.root.join("spec/support/**/*.rb")].each {|f| require f}

FactoryGirl.find_definitions

Goliath.env = :test

RSpec.configure do |config|
  config.include Goliath::TestHelper, :example_group => {
    :file_path => /spec\//
  }

  config.include APITestMethods,
    type: :request,
    example_group: { file_path: /spec\/(api|web)/ }
end

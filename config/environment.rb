
Encoding.default_internal = Encoding::UTF_8
Encoding.default_external = Encoding::UTF_8

require 'rubygems'

require File.absolute_path("../../app/libs/core.rb", __FILE__)

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

#if File.exists?(ENV['BUNDLE_GEMFILE'])
#  require 'bundler/setup'
#  Bundler.require(:default, RufinoApi.env)
#end

# MongoId expects RACK_ENV to autoload the configuration from the mongoid.yml file
ENV["RACK_ENV"] ||= RufinoApi.env

# Load initializers
RufinoApi.root.join("config", "initializers").each_child do |initializer_file|
  require initializer_file.realpath if initializer_file.extname == ".rb"
end

# Load everything
Dir["#{RufinoApi.root}/app/**/*.rb"].each {|filename| require filename }

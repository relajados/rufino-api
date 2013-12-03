require 'mongoid'

Mongoid.logger = RufinoApi.logger
Mongoid.load!(RufinoApi.root.join("config", "mongoid.yml").realpath)

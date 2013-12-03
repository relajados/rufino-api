require 'goliath'
require ::File.expand_path('../config/environment',  __FILE__)


class App < Goliath::API
  def response(env)
    RufinoApi.application.call(env)
  end
end


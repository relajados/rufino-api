require 'grape'

module ApiBase

  class UserSessionErrors < Grape::Middleware::Base

    def call!(env)
      @env = env
      @app.call(@env)

  #  rescue UserSession::ExpiredTokenError
  #    throw :error, message:"token expired" , :status => 401

  #  rescue UserSession::InvalidTokenError
  #    throw :error, message: "token invalid", :status => 401

    rescue Mongoid::Errors::DocumentNotFound
      throw :error, message: "Object not found", :status => 404

    end
  end

  def self.expand(cls)
    cls.instance_eval do
      default_format :json
      use UserSessionErrors

      helpers do
        def current_user!
          #basic_request = Rack::Auth::Basic::Request.new(env)
          #if basic_request.provided?
          #  user, password = basic_request.credentials

          #  # If the password is huge, we can interpret that it is a token.
          #  if password.size > 150
          #    UserSession.load password
          #  else
          #    User.authenticate(user, password) || error!("Unauthorized", 401)
          #  end

          #else
          #  error! "Unauthorized", 401
          #end
        end
      end
    end
  end
end

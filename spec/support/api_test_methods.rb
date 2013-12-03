
module APITestMethods
  include Rack::Test::Methods

  def app
    RufinoApi.application
  end

  # This helper check if the given requests is checking the
  # authentication credentials.
  #
  # A block is given to make the requests. Something like
  #
  #   for_logged_users { put "/users/me", name: "foo" }
  #

  #def for_logged_users
  #  # Check if an anonymous user can requests the URI
  #  authorize nil, nil
  #  response = yield
  #  response.status.should == 401
  #  response.content_type.should == "application/json"

  #  # Check and invalid token
  #  authorize "--", "00000--111"
  #  response = yield
  #  response.content_type.should == "application/json"

  #  # Check and expired token
  #  user = Factory :user
  #  authorize ".", UserSession.token(user, 1.year.ago)[:token]

  #  body = load_json(401) { yield }
  #  body["error"].should == "token expired"
  #end

end

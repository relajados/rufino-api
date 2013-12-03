
RSpec.configure do |config|
  # Clear the database before running every spect
  config.before :each do
    Mongoid.default_session.collections.select {|c| c.name !~ /system/ }.each(&:drop)
  end
end

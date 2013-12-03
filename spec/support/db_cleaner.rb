
RSpec.configure do |config|
  # Clear the database before running every spect
  config.before :each do
    Mongoid.database.collections.each do |coll|
      coll.remove unless coll.name.starts_with?("system.")
    end
  end
end

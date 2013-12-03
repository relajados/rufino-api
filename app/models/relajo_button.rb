class RelajoButton

  include Mongoid::Document
  include Mongoid::Timestamps

  field :label
  field :url

end

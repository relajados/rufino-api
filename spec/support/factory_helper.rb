module Kernel

  def Factory(*args, &block)
    FactoryGirl.create(*args, &block)
  end

end

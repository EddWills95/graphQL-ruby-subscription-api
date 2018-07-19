class Counter < ApplicationRecord

  def increment
    self.value += 1
    self.save
  end

end

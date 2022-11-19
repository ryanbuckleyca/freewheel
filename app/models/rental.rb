class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :bike

  def accept!
    self.booking_confirmed = true
  end

  def reject!
    self.booking_confirmed = false
  end

end

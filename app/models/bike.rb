class Bike < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  has_many :rentals, dependent: :destroy

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

end

class Bike < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  has_many :rentals, dependent: :destroy

  include AlgoliaSerach

  algoliaserach do 
    attributes :location
  end
end

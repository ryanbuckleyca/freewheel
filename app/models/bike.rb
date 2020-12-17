class Bike < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :rentals, dependent: :destroy

  def image(height, width, classname)
    if photo.attached?
      cl_image_tag photo.key, height: height, width: width, crop: :fill, class: classname
    else
      url = "https://source.unsplash.com/#{width}x#{height}/?#{bike_type.gsub(/\s/, ',')},bicycle"
      "<img src='#{url}' alt='bike' class='#{classname}' width='#{width}' height='#{height}'>"
    end
  end

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end

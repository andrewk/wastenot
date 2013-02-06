class Thing < ActiveRecord::Base
  attr_accessible :description, :expires_at, :latitude, :longitude, :title, :image, :address

  mount_uploader :image, ImageUploader

  validates_presence_of :title

  reverse_geocoded_by :latitude, :longitude do |thing,results|
    if geo = results.first
      thing.city            = geo.suburb || geo.city
      thing.postal_code     = geo.postal_code
      thing.country         = geo.country
      thing.street_address  = "#{geo.house_number} #{geo.street}"
      thing.state           = geo.state
    end
  end
  geocoded_by :address

  after_validation :reverse_geocode
  after_validation :geocode

  def address
    super || "#{street_address}, #{city}, #{country}"
  end
end

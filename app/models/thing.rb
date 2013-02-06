class Thing < ActiveRecord::Base
  attr_accessible :description, :expires_at, :latitude, :longitude, :title, :image

  mount_uploader :image, ImageUploader

  validates_presence_of :title

  reverse_geocoded_by :latitude, :longitude do |thing,results|
    if geo = results.first
      thing.city        = geo.suburb || geo.city
      thing.postal_code = geo.postal_code
      thing.country     = geo.country
      thing.address     = "#{geo.house_number} #{geo.street}"
      thing.state       = geo.state
    end
  end

  after_validation :reverse_geocode
end

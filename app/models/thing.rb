class Thing < ActiveRecord::Base
  attr_accessible :description, :expires_at, :latitude, :longitude, :title, :image, :address, :reported_gone_at

  default_scope where("reported_gone_at IS NULL")

  mount_uploader :image, ImageUploader

  geocoded_by :address do |obj, results|
    if geo = results.first
      obj.latitude = geo.latitude
      obj.longitude = geo.longitude
      obj.street_address = geo.street_address
      obj.country = geo.country
      obj.state  = geo.state
      obj.postal_code = geo.postal_code
      obj.city = geo.city
    end
  end

  validates_presence_of :title, :address

  after_validation :geocode
end

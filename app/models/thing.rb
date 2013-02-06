class Thing < ActiveRecord::Base
  attr_accessible :description, :expires_at, :latitude, :longitude, :title, :image

  mount_uploader :image, ImageUploader

  validates_presence_of :title
end

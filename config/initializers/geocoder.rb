Geocoder.configure(

  :units  => :km,
  :cache  => Redis.new(:url => Rails.application.config.redis)

)

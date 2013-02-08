Geocoder.configure(

  :units  => :km,
  :cache  => Redis.new(:url => "redis://localhost:6379")

)

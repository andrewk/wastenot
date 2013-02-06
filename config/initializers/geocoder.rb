Geocoder.configure(

  :lookup => :nominatim,
  :units  => :km,
  :cache  => Redis.new(:url => "redis://localhost:6379")
  

)
